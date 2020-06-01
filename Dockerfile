FROM ubuntu:latest
COPY ./programm.asm ./home
COPY ./main.py ./home
RUN apt-get -q update && apt-get install -y --no-install-recommends apt-utils
RUN apt -q install -y nasm
RUN apt-get -q install -y gdb
RUN apt-get -q install -y gcc
WORKDIR ./home/
RUN nasm -f elf64 programm.asm
RUN ld programm.o -o pr
MAINTAINER Ekaterina Grohotova <katya.grohotova.4@gmail.com>