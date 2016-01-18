# how it works

It mounts current folder(.) to /app in container and uses codeviz compiler (gcc,
g++) to compile the source code in current folder, then generates the callgraph
in `png` format.

You may add `make` options to `codeviz-make.sh` script, it will be executed
via docker-compose command.

## requirements

* docker
* docker-compose

## execute

```
$ cp docker-compose.yml <your project root>
$ cp codeviz-make.sh <your project root>
$ cd <your project root>
$ docker-compose run --rm codeviz
```


# Appendix

## Codeviz

* [http://www.csn.ul.ie/~mel/projects/codeviz/](http://www.csn.ul.ie/~mel/projects/codeviz/)

### genfull help

```
Usage:
    genfull [options]

     Main Options:
      -d, --toplevel Top level source directory (Default: current)
      -f, --file     Files to scan for data     (Default: find all files)
      -s, --subdirs  Subdirectories to graph    (Default: all)
      -g, --method   Method for collecting data (Default: cdepn)
      -o, --output   Output graph               (Default: ./full.graph)
      -h, --help     Print this message
      --version      Print the version number

     Post-Processing Options:
      --skip         Skip collection and only post-process
      --pp-stack     Calculate stack usage

     For Linux kernel call graphs, the following calling is recommended 
     genfull -s "arch/i386 net lib ipc mm fs net kernel init drivers"
```

### gengraph help

```
    gengraph - Generate a call graph for a given set of functions

Usage:
    gengraph [options]

      Main Options:
      -f, --function    Top level functions to graph, quote if more than one
      -t, --trim        Ignore a set of Linux kernel functions (Kernel specific)
      -i, --ignore      Functions to ignore
      -s, --show        Show a function but not the sub-functions
      -d, --maxdepth    Maximum depth of graph
      -r, --reverse     Place the function at the bottom and graph callers
      -g, --graph       Source graph from by genfull (Default: ./full.graph)
      -l, --location    Show the location of the function declarations
      -a, --all-locs    Show the location of declarations and calls
      -k, --keep        Keep the sub.graph file
      -o, --output      Output postscript filename
      -v, --verbose     Verbose output
      -h, --help        Print this message
      --no-extern       Ignore functions not defined in the current source
      --output-type     Set the output type: ps, html png or gif (default: ps)
      --output-font     What font to use for output graph (default: Helvetica)
      --output-fontsize Size of output font (default: 12)
      --output-layout   Layout direction: LR|RL|BT|TB (default TB)
      --version         Print the version number

      HTML Options (specify --output-type=html above):
      -e, --source      Root of the source code being graphed
      --html-fragment   Generate HTML suitable for including in another page
      --base-url        Template URL to use for hyperlinks in the web page
      --shighlight      Use source-highlight for HTML links
      --scss            Cascading style-sheet to use for source-highlight

      Regular Expression Options:
      -z, --func-re     Regular expressions of top-level functions to graph
      -j, --ignore-re   Regular expressions of functions to ignore
      -y, --show-re     Regular expressions of functions to show but not traverse

      Post-Processing Options:
      --pp-stack        Show stack usage and highlight excessive usage
      --pp-cstack       Show cumulative usage in a given set of code paths
      --pp-oprofile     Show function costs from an oprofile report

      Daemon Options:
      -p, --daemon      Run gengraph as a daemon
      -q, --client      Run gengraph as a client to a gengraph daemon
      --plain           Output the dot graph file but do not use dot
      --stdout          Use this file as standard out instead of normal
      --stderr          Print errors to this file instead of STDERR
```

### output after installing codeviz

```
Patched gcc is installed to /usr/local/gccgraph. To compile a project
for use with CodeViz, genearlly the following will work

  make CC=/usr/local/gccgraph/bin/gcc or g++

To generate a full.graph file for C, use

  genfull

For C++, make sure you use the cppdepn method with

  genfull -g cppdepn

or the results will not be what you expect.
```
