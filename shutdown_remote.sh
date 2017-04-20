#!/bin/bash
#Please mention IP/Hostnames of servers in a text fil who needs to be shutdown....I have added those in /root/serverlist.txt
for i in $(cat /root/serverlist.txt)
do
sshpass -p "ssh password" ssh -o StrictHostKeyChecking=no root@$i "/sbin/shutdown -h now"
#echo "$i is shutdown"
done
