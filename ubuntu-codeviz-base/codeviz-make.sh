#!/bin/bash
make CXX=/usr/local/gccgraph/bin/g++
genfull 
gengraph -t -g ./full.graph --no-extern -output-type png --output-layout LR
