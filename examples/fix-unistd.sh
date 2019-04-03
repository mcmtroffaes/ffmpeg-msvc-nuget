#!/bin/bash
find . -type f -name "*.c" -exec sed -i 's/unistd[.]h/io.h/g' {} \;
