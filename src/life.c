#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#ifndef BUILD_NAME
#define BUILD_NAME "life"
#endif

typedef struct {
    int      n;
    int      w;
    uint8_t *cells;
} Grid;

static double now_s(clockid_t clk)
{
    struct timespec ts;
    clock_gettime(clk, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

static void *xcalloc(size_t count, size_t size)
{
    void *p = calloc(count, size);
    if (!p) {
        fprintf(stderr, "Не вистачає пам'яті\n");
        exit(1);
    }
    return p;
}

static Grid grid_new(int n)
{
    Grid g = { n, n + 2, xcalloc((size_t)(n + 2) * (n + 2), 1) };
    return g;
}

static uint32_t rng = 20251024u;

static uint32_t next_rand(void)
{
    rng = rng * 1664525u + 1013904223u;
    return rng;
}

static inline uint8_t neighbors(const uint8_t *c, int w)
{
    return c[-w - 1] + c[-w] + c[-w + 1]
         + c[-1]              + c[1]
         + c[w - 1]  + c[w]  + c[w + 1];
}

static inline uint8_t rule(uint8_t alive, uint8_t n)
{
    return (n == 3) | (alive & (n == 2));
}

__attribute__((noinline))
void init_random(Grid *g, int percent)
{
    uint32_t threshold = (uint32_t)percent * 256 / 100;
    for (int i = 1; i <= g->n; i++)
        for (int j = 1; j <= g->n; j++)
            g->cells[i * g->w + j] = (next_rand() >> 24) < threshold;
}

__attribute__((noinline))
void step(const Grid *cur, Grid *next)
{
    const int n = cur->n, w = cur->w;
    const uint8_t *restrict src = cur->cells;
    uint8_t *restrict dst = next->cells;

    for (int i = 1; i <= n; i++) {
        const uint8_t *row = src + i * w;
        uint8_t *out = dst + i * w;
        for (int j = 1; j <= n; j++)
            out[j] = rule(row[j], neighbors(row + j, w));
    }
}

__attribute__((noinline))
long count_alive(const Grid *g)
{
    long sum = 0;
    for (int i = 1; i <= g->n; i++)
        for (int j = 1; j <= g->n; j++)
            sum += g->cells[i * g->w + j];
    return sum;
}

__attribute__((noinline))
uint64_t grid_hash(const Grid *g)
{
    size_t bytes = (size_t)g->w * g->w;
    uint64_t h = 1469598103934665603ull;
    size_t k = 0;
    for (; k + 8 <= bytes; k += 8) {
        uint64_t word;
        memcpy(&word, g->cells + k, 8);
        h = (h ^ word) * 1099511628211ull;
    }
    for (; k < bytes; k++)
        h = (h ^ g->cells[k]) * 1099511628211ull;
    return h;
}

__attribute__((noinline))
void save_pgm(const Grid *g, const char *path)
{
    FILE *f = fopen(path, "wb");
    if (!f) {
        perror(path);
        return;
    }
    fprintf(f, "P5\n%d %d\n255\n", g->n, g->n);
    uint8_t *line = xcalloc(g->n, 1);
    for (int i = 1; i <= g->n; i++) {
        for (int j = 1; j <= g->n; j++)
            line[j - 1] = g->cells[i * g->w + j] ? 0 : 255;
        fwrite(line, 1, g->n, f);
    }
    free(line);
    fclose(f);
}

static int self_test(void)
{
    static const int glider[5][2] = { {1, 2}, {2, 3}, {3, 1}, {3, 2}, {3, 3} };
    Grid a = grid_new(8), b = grid_new(8);
    for (int k = 0; k < 5; k++)
        a.cells[glider[k][0] * a.w + glider[k][1]] = 1;
    for (int gen = 0; gen < 4; gen++) {
        step(&a, &b);
        Grid t = a; a = b; b = t;
    }
    int ok = count_alive(&a) == 5;
    for (int k = 0; k < 5; k++)
        ok &= a.cells[(glider[k][0] + 1) * a.w + glider[k][1] + 1] == 1;
    free(a.cells);
    free(b.cells);
    return ok;
}

int main(int argc, char **argv)
{
    int n = argc > 1 ? atoi(argv[1]) : 1024;
    int gens = argc > 2 ? atoi(argv[2]) : 1500;
    const char *pgm = argc > 3 ? argv[3] : NULL;
    if (n <= 0 || gens <= 0) {
        fprintf(stderr, "Використання: %s [N] [GENERATIONS] [файл.pgm]\n", argv[0]);
        return 1;
    }
    double cpu0 = now_s(CLOCK_PROCESS_CPUTIME_ID);
    double t_start = now_s(CLOCK_MONOTONIC);
    printf("Гра «Життя» [%s]: поле %d×%d, поколінь = %d\n", BUILD_NAME, n, n, gens);
    printf("Самоперевірка (глайдер за 4 покоління зсувається на (1,1)): %s\n",
           self_test() ? "OK" : "ПОМИЛКА");

    Grid cur = grid_new(n), nxt = grid_new(n);
    double t0 = now_s(CLOCK_MONOTONIC);
    init_random(&cur, 30);
    double t_init = now_s(CLOCK_MONOTONIC) - t0;

    long *pop = xcalloc(gens + 1, sizeof(long));
    pop[0] = count_alive(&cur);
    double t_step = 0, t_count = 0, t_hash = 0;
    uint64_t prev_hash = 0;
    int stable_at = -1;
    for (int g = 1; g <= gens; g++) {
        double a = now_s(CLOCK_MONOTONIC);
        step(&cur, &nxt);
        Grid t = cur; cur = nxt; nxt = t;
        double b = now_s(CLOCK_MONOTONIC);
        pop[g] = count_alive(&cur);
        double c = now_s(CLOCK_MONOTONIC);
        t_step += b - a;
        t_count += c - b;
        if (g % 10 == 0) {
            uint64_t h = grid_hash(&cur);
            if (h == prev_hash && stable_at < 0)
                stable_at = g;
            prev_hash = h;
            t_hash += now_s(CLOCK_MONOTONIC) - c;
        }
    }

    long pmin = pop[0], pmax = pop[0];
    for (int g = 1; g <= gens; g++) {
        if (pop[g] < pmin) pmin = pop[g];
        if (pop[g] > pmax) pmax = pop[g];
    }
    uint64_t checksum = grid_hash(&cur);
    if (pgm)
        save_pgm(&cur, pgm);

    double cells = (double)n * n * gens;
    printf("Населення: на старті %ld, наприкінці %ld (мін. %ld, макс. %ld)\n",
           pop[0], pop[gens], pmin, pmax);
    if (stable_at > 0)
        printf("Поле застигло (повторюється з кроком 10) з покоління %d\n", stable_at);
    else
        printf("Поле не застигло за %d поколінь\n", gens);
    printf("Ініціалізація:          %8.3f с\n", t_init);
    printf("Обчислення поколінь:    %8.3f с  (%.3f нс/клітинку, %.0f млн клітинок/с)\n",
           t_step, t_step * 1e9 / cells, cells / t_step / 1e6);
    printf("Підрахунок населення:   %8.3f с\n", t_count);
    printf("Хешування поля:         %8.3f с\n", t_hash);
    printf("Контрольна сума поля:   %016llx\n", (unsigned long long)checksum);

    double cpu1 = now_s(CLOCK_PROCESS_CPUTIME_ID);
    printf("RESULT build=%s n=%d gens=%d init_s=%.4f step_s=%.4f count_s=%.4f hash_s=%.4f "
           "total_s=%.4f cpu_s=%.4f ns_per_cell=%.4f final_pop=%ld checksum=%016llx\n",
           BUILD_NAME, n, gens, t_init, t_step, t_count, t_hash,
           now_s(CLOCK_MONOTONIC) - t_start, cpu1 - cpu0, t_step * 1e9 / cells,
           pop[gens], (unsigned long long)checksum);
    free(pop);
    free(cur.cells);
    free(nxt.cells);
    return 0;
}
