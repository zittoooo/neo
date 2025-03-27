#!/bin/bash

config=$(ps -ef | grep 'mongoConfig')
router=$(ps -ef | grep 'mongoRouter')
shard1=$(ps -ef | grep 'mongoShard1')
shard2=$(ps -ef | grep 'mongoShard2')

pid1=$(echo ${config} | cut -d " " -f2)
pid2=$(echo ${router} | cut -d " " -f2)
pid3=$(echo ${shard1} | cut -d " " -f2)
pid4=$(echo ${shard2} | cut -d " " -f2)

for var in $pid1 $pid2 $pid3 $pid4
do
    echo $var
    if [ -n ${var} ]; then
        result=$(kill -9 ${var})
        echo process is killed.
    else
        echo running process not found.
    fi
done
echo