#!/bin/bash

user=$(whoami)
host=$(hostname)
kernel=$(uname -r)
current_date=$(date)
ip=$(hostname -I)

echo "===== SYSTEM INFORMATION ====="
echo "User: $user"
echo "Hostname: $host"
echo "Kernel: $kernel"
echo "Date: $current_date"
echo "IP: $ip"
echo "=============================="
