#!/bin/bash

echo "===== pktgen result summary ====="

let total_pps=0
let total_bps=0

for ((i = 0; i < $1; i++)); do
        echo "Device: eth0@${i}"
        result_cur_device=$(cat /proc/net/pktgen/eth0@${i} | grep -A2 "Result:")
        echo $result_cur_device
        cur_device_pps=$(echo $result_cur_device | awk '{print $7}')
        cur_bps_str=$(echo $result_cur_device | awk '{print $9}')
        cur_bps_str=${cur_bps_str#(}
        cur_bps_num=$((${cur_bps_str%bps*}))
        cur_pps_num=$((${cur_device_pps%pps}))
        total_pps=$(($total_pps+$cur_pps_num))
        total_bps=$(($total_bps+$cur_bps_num))
	echo "--------"
done

echo "total_pps: $total_pps pps"
echo "total_bps: $total_bps bps"

echo "===== end ====="
