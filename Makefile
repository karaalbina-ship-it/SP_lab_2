CC     ?= gcc
SRC    := src/life.c
OUT    := build
COMMON := -g -fno-omit-frame-pointer -Wall -Wextra

FLAGS_O0     := -O0
FLAGS_O3     := -O3
FLAGS_native := -O3 -march=native

BUILDS := life_O0 life_O3 life_native

all: $(addprefix $(OUT)/,$(BUILDS))

$(OUT)/life_%: $(SRC) Makefile | $(OUT)
	$(CC) $(COMMON) $(FLAGS_$*) -DBUILD_NAME='"life_$*"' $< -o $@

asm: $(addprefix $(OUT)/,$(addsuffix .s,$(BUILDS)))

$(OUT)/life_%.s: $(SRC) Makefile | $(OUT)
	$(CC) $(COMMON) $(FLAGS_$*) -S -masm=intel -fverbose-asm $< -o $@

vecreport: | $(OUT)
	$(CC) $(COMMON) $(FLAGS_O3) -c $(SRC) -o /dev/null -fopt-info-vec-all 2> $(OUT)/vec_O3.txt
	$(CC) $(COMMON) $(FLAGS_native) -c $(SRC) -o /dev/null -fopt-info-vec-all 2> $(OUT)/vec_native.txt

$(OUT):
	mkdir -p $@

clean:
	rm -rf $(OUT)

.PHONY: all asm vecreport clean
