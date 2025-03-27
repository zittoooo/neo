#!/bin/bash

master=$(ps -ef | grep 'master')
slave1=$(ps -ef | grep 'slave1')
slave2=$(ps -ef | grep 'slave2')
arbiter=$(ps -ef | grep 'arbiter')

pid1=$(echo ${master} | cut -d " " -f2)
pid2=$(echo ${slave1} | cut -d " " -f2)
pid3=$(echo ${slave2} | cut -d " " -f2)
pid4=$(echo ${arbiter} | cut -d " " -f2)

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