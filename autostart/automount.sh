#!/bin/bash
# automount.sh


mount /dev/sda2 /media/sda2
mount /dev/sda2 /media/sda2 -o rw,remount
swapon /dev/sda2

ln -s /media/sda2/ /root/home
ln -s /media/sda2/ /home/blackleakz