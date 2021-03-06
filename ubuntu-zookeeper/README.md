#Zookeeper
(forked from [https://github.com/ContainerSolutions/zookeeper](https://github.com/ContainerSolutions/zookeeper) sha1: 4d322eefd2b673c82884ab2b5c40f13fb75ac27b)
This Docker image contains Zookeeper 3.5.1-rc2 which features dynamic host reconfiguration. Upon start, it attempts to join an existing cluster.

The syntax to start a container is like this:

  `docker run --net host --name [name] containersol/zookeeper [id] [ip]`
  
where 
  - `id` = id of the zookeeper node (known internally as myid)
  - `ip` = ip address of a node of the existing cluster
  
The `id` is mandatory, the `ip` is optional.

The `--net host` is needed for zookeepers on different hosts to be able to contact each other.
