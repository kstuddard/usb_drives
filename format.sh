#!/bin/bash
set -euxo pipefail
if [[ $UID != 0 ]]; then
echo "Please run this script with sudo:"
  echo "sudo $0 $*"
  exit 1
fi

devices=(/dev/sdc /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh)

for dev in "${devices[@]}" ;
do
  parted -s "$dev" mklabel msdos
  parted -s "$dev" mkpart primary ntfs 0% 100%
  part="$dev"1
  sleep 1 
  mkfs.ntfs -fC $part
done
