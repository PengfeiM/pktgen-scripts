#!/bin/bash

for ((i = 0; i < $1; i++)); do
        echo "Device: eth0@${i}"
        cat /proc/net/pktgen/eth0@${i} | grep -A2 "Result:"
	echo "--------"
done
