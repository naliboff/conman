#!/bin/bash 
date > log_Date
uname -n       > log_machine
CPU=`grep -c ^processor /proc/cpuinfo`
ls -l ../conman > log_bin
count=0;
for dir in  ./test_*  ; do
   ./run_us.bash $dir &
#  count=$((count + 1))
#  if (($count == $CPU)) ; then
#      wait
#      count=0
#  fi
done
