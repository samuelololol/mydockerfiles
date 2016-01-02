### with prepared zookeeper(s)
* [docker-compose.yml](https://github.com/samuelololol/mydockerfiles/blob/master/ubuntu-zookeeper/docker-compose.yml)
* commands

```
$ docker-compose up -d
$ docker-compose scale zks=2
```

* edit external_links in [docker-compose-kafka.yml](https://github.com/samuelololol/mydockerfiles/blob/master/ubuntu-kafka/docker-compose-kafka.yml)
* start kafka

```
$ docker-compose -f docker-compose-kafka.yml up -d
$ docker-compose -f docker-compose-kafka.yml scale kafka=3
```

### standalone
```
$ docker-commpose -f docker-compose-standalone up -d
```
