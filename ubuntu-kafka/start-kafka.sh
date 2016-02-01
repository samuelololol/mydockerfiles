#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    return 1
fi

if [[ -z "$KAFKA_ADVERTISED_HOST_NAME"  ]]; then
    export KAFKA_ADVERTISED_HOST_NAME=$(route -n | awk '/UG[ \t ]/{print $2}')
fi
if [[ -z "$KAFKA_BROKER_ID"  ]]; then
    export KAFKA_BROKER_ID=$(docker inspect `hostname` | jq --raw-output '.[0] | .Name' | awk -F_ '{print $3}')
    [ "$1" == "slave" ] && export KAFKA_BROKER_ID=$(($KAFKA_BROKER_ID + 1))
fi
if [[ -z "$KAFKA_LOG_DIRS" ]]; then
    export KAFKA_LOG_DIRS="/kafka/kafka-logs-$KAFKA_BROKER_ID"
fi
if [[ -n "$KAFKA_HEAP_OPTS" ]]; then
    sed -r -i "s/(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"$KAFKA_HEAP_OPTS\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
    unset KAFKA_HEAP_OPTS
fi

[ "$1" == "master" ] && \
    export KAFKA_ADVERTISED_HOST_NAME=$(docker inspect `hostname` | jq --raw-output '.[0] | .NetworkSettings.IPAddress')
[ "$1" == "slave" ] && \
    export KAFKA_ADVERTISED_HOST_NAME=$(docker inspect ubuntukafka_kfkm_1 | jq --raw-output '.[0] | .NetworkSettings.IPAddress')
export KAFKA_HOST_NAME=$(docker inspect `hostname` | jq --raw-output '.[0] | .NetworkSettings.IPAddress')

for VAR in `env`
do
    if [[ $VAR =~ ^KAFKA_ && ! $VAR =~ ^KAFKA_HOME ]]; then
        kafka_name=`echo "$VAR" | sed -r "s/KAFKA_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
        env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
        if egrep -q "(^|^#)$kafka_name=" $KAFKA_HOME/config/server.properties; then
            sed -r -i "s@(^|^#)($kafka_name)=(.*)@\2=${!env_var}@g" $KAFKA_HOME/config/server.properties #note that no config values may contain an '@' char
        else
            echo "$kafka_name=${!env_var}" >> $KAFKA_HOME/config/server.properties
        fi
    fi
done
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
