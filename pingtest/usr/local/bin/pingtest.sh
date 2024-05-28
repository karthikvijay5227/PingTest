#!/usr/bin/bash
count=0
read -p "Enter the IP network pool (eg:192.168.10): " ip
while [ $count -lt 256 ];do
    output=$(ping -c 1 $ip.$count)
    if echo "$output" | grep -q "64 bytes";then
        echo "$ip.$count is Up"
    elif echo "$output" | grep -q "100% packet loss";then
        echo "$ip.$count is Down"
    else
        echo "$ip.$count is Down"
    fi
    ((count++))
done