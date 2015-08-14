buildbot create-master -r /app
wget -O /app/master.cfg https://raw.githubusercontent.com/samuelololol/mydockerfiles/master/ubuntu-buildbot-master/master.cfg
buildbot start --nodaemon /app
