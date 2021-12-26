#!/bin/bash
set -euxo pipefail
if [[ $UID != 0 ]]; then
echo "Please run this script with sudo:"
  echo "sudo $0 $*"
  exit 1
fi

devices=( "$@" )

dt=`date +%Y%m%d_%H%M%S`
for dev in "${devices[@]}" ;
do
  if [ -b $dev ]; then
    part="$dev"1
    # read test
    fname="benchmark_${dt}.txt"
    hdparm -Ttv $part | tee -a "$fname"
    # write test; does not work right now (how should I moutn stuff?...
    mount $part /mnt 
    dd if=/dev/zero of=/mnt/temp oflag=direct bs=128k count=32k | tee -a "$fname"
    sync
    umount /mnt
  else
    echo "'$dev' is not a block device!"
  fi
done
