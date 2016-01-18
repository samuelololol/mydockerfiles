#!/bin/bash
make CXX=/usr/local/gccgraph/bin/g++ CC=/usr/local/gccgraph/bin/gcc
genfull 
gengraph -t -g ./full.graph --no-extern -output-type png --output-layout LR -f main
