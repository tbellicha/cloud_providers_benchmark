#!/bin/bash 

sudo apt-get update

sudo apt-get install sysbench 

sysbench --test=cpu run | grep "total time" | awk '{print $3}'

sysbench --test=memory run | grep "total time" | awk '{print $3}'

sysbench --test=fileio --file-test-mode=seqwr run | grep "total time" | awk '{print $3}'