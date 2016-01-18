### execute

```
$ docker-compose run --rm codeviz
```

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
