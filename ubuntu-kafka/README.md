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
$ docker-compose -f docker-compose-kafka.yml scale kafs=2
```

### standalone
```
$ docker-commpose -f docker-compose-standalone up -d
```

### test
```
# enter kafka container
$ docker exec -it ubuntukafka_kfkm_1 /bin/bash

# create topic
(root@xxxx):/# /opt/kafka-xxxx/bin/kafka-topics.sh --create --topic test --zookeeper zk1:2181 --partitions 1 --replication-factor 1

# consume from the topic using the console producer
(root@xxxx):/# /opt/kafka-xxxx/bin/kafka-console-consumer.sh --topic test --zookeeper zk1:2181

# using another console to create producer
(root@xxxx):/# /opt/kafka-xxxx/bin/kafka-console-producer.sh --topic test --broker-list localhost:9092
```
