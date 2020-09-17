#!/bin/bash

BIN_DIR=bin
OUT_FILE=$BIN_DIR/myvm.o
BINARY_FILE=$BIN_DIR/myvm

mkdir $BIN_DIR
nasm -f elf64 src/myvm.asm -o $OUT_FILE
ld $OUT_FILE -o $BINARY_FILE
./$BINARY_FILE

rm -r bin

