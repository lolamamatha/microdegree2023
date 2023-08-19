#!/bin/bash

echo "Server Details:"
echo "----------------"

# Get hostname
hostname=$(hostname)
echo "Hostname: $hostname"

# Get uptime
uptime=$(uptime -p)
echo "Uptime: $uptime"

# Get kernel version
kernel=$(uname -r)
echo "Kernel Version: $kernel"

# Get CPU information
cpu_info=$(cat /proc/cpuinfo | grep "model name" | head -n 1 | cut -d ':' -f 2-)
echo "CPU: $cpu_info"

# Get total memory
total_memory=$(free -h | awk '/Mem:/ {print $2}')
echo "Total Memory: $total_memory"

# Get total disk space
total_disk=$(df -h --total | awk '/total/ {print $2}')
echo "Total Disk Space: $total_disk"

# Get IP addresses
ip_addresses=$(ip -4 addr | grep inet | awk '{print $2}')
echo "IP Addresses:"
echo "$ip_addresses"

echo "----------------"
