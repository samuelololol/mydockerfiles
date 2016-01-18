### how it works

It mounts current folder(.) to /app in container and uses codeviz compiler (gcc,
g++) to compile the source code in current folder, then generates the callgraph
in `png` format.

You may add `make` options to `codeviz-make.sh` script, it will be executed
via docker-compose command.

### requirements

* docker
* docker-compose

### execute

```
$ cp docker-compose.yml <your project root>
$ cp codeviz-make.sh <your project root>
$ cd <your project root>
$ docker-compose run --rm codeviz
```


# Appendix

### codeviz output

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
