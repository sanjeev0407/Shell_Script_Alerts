#!/bin/bash
RED='\033[0;31m' # selfexplanatory
NC='\033[0m'     # No Color

cpuuse=$(cat /proc/loadavg | awk '{print $3}'|cut -f 1 -d ".")
if [ "$cpuuse" -ge 85 ]; then
SUBJECT="ATTENTION: CPU load is high on $(hostname) at $(date)"
MESSAGE="/tmp/Mail.out"
TO="username@gmail.com"
  echo -e "${RED}CPU current usage is: $cpuuse%${NC}" >> $MESSAGE
  echo -e "${RED} ${NC}" >> $MESSAGE
  echo -e "${RED}+------------------------------------------------------------------+${NC}" >> $MESSAGE
  echo -e "${RED}Top 15 processes which consuming high CPU${NC}" >> $MESSAGE
  echo -e "${RED}+------------------------------------------------------------------+${NC}" >> $MESSAGE
  echo -e "${RED} $(top -bn1 | head -15) ${NC}" >> $MESSAGE
  echo -e "${RED}${NC}" >> $MESSAGE
  echo -e "${RED}+------------------------------------------------------------------+${NC}" >> $MESSAGE
  echo -e "${RED}Top 10 Processes which consuming high CPU using the ps command ${NC}" >> $MESSAGE
  echo -e "${RED}+------------------------------------------------------------------+${NC}" >> $MESSAGE
  echo -e "${RED} $(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10) ${NC}" >> $MESSAGE
  mail -s "$SUBJECT" "$TO" < $MESSAGE
  rm /tmp/Mail.out
else
echo "Server CPU usage is in under threshold"
  fi
