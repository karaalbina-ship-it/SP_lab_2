FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential binutils linux-tools-generic linux-tools-common time git ca-certificates \
        procps libc6-dbg \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf "$(ls -d /usr/lib/linux-tools/*-generic/perf | sort -V | tail -n1)" /usr/local/bin/perf

RUN git clone --depth 1 https://github.com/brendangregg/FlameGraph /opt/FlameGraph

WORKDIR /lab
