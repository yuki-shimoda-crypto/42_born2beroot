# !/bin/bash
Architecture=$(uname -a)
CPU_physical=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
vCPU=$(cat /proc/cpuinfo | grep "physical id" | wc -l)
Memory_Usage=$(free -m | awk 'NR==2 {printf "%s/%sMB (%.2f%%)\n", $3,$2,$3/$2*100}')
Disk_Usage=$(df -BM | awk '$NF=="/" {printf "%s/%s (%.2f%%)\n", $3,$2,$3/$2*100}')
CPU_load=$(top -bn1 | awk 'NR==3 {printf "%d%%\n", $2 + $4 + $6}')
Last_boot=$(last reboot | awk 'NR==1 {printf "%s_%s_%s\n", $6 ,$7, $8}')
LVM_use=$(lsblk |grep lvm | awk '{if ($1) {print "yes";exit;} else {print "no"} }')
Connections_TCP=$(netstat -an | grep ESTABLISHED |grep tcp | wc -l)
User_log=$(who | cut -d " " -f 1 | sort -u | wc -l)
Network=$(hostname -I | tr '\n' ' ' && ip a | grep link/ether | awk '{printf "(%s)\n", $2}')
Sudo=$(cat /var/log/sudo/sudo.log | grep TSID | wc -l)

wall "
#Architecture: ${Architecture}
#CPU physical: ${CPU_physical}
#vCPU: ${vCPU}
#Memory Usage: ${Memory_Usage}
#Disk Usage: ${Disk_Usage}
#CPU load: ${CPU_load}
#Last boot: ${Last_boot}
#LVM use: ${LVM_use}
#Connections TCP: ${Connections_TCP}
#User log: ${User_log}
#Network: ${Network}
#Sudo: ${Sudo}"