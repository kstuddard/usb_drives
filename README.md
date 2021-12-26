# usb_drives
batch formatting and bechmarking drives

## usage 
**script** */dev/sda /dev/sdb /dev/sdN*

`format.sh` will re-initialize the drives with MSDOS disklabel and do a quick NTFS format

`benchmark.sh` will create benchmark files for the drives using `hdparm` (read) and `dd` (write)
