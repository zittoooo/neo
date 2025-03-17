#!/bin/bash

opt1=$1
opt2=$2

if [ $# -eq 2 ]; then
    if [ $opt1 == 'aaa' -a $opt2 == 'test' ] || [ $opt1 == 'test' -a $opt2 == 'aaa' ]; then
        echo great
    else
        echo bad
    fi
else
    echo "Input twoparamters...!!!"
fi