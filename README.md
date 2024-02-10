# How-To-Linux-Service

```
Author: BlackLeakz
Description:

Here you will learn how to create s systemd-service, enable & start it!

```

If you want to auto-start a service on startup, create at first a work-folder in: /usr/share/.autostart  : for example!!!!
```sh
mkdir -p /usr/share/.autostart
```

Then you need a bash-script you want to autostart!
In my case, i'll automount my hdd.

```sh
nano /usr/share/.autostart/automount.sh
```

The script:
```sh

#!/bin/bash
# automount.sh


mount /dev/sda2 /media/sda2
mount /dev/sda2 /media/sda2 -o rw,remount
swapon /dev/sda2

ln -s /media/sda2/ /root/home
ln -s /media/sda2/ /home/blackleakz
```

Next: Make file executeable!

```sh
chmod a+x /usr/share/.autostart/automount.sh

```

Now we need to create the systemd-service! 

```sh
nano /etc/systemd/system/automount.service
```
Its conetent should look like this:

```sh
[Unit]
Description=BlackLeakz Automount
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=centos
ExecStart=/bin/bash /usr/share/.autostart/automount.sh

[Install]
WantedBy=multi-user.target
```
Now just, enable & start the service by executing:
```sh
systemctl enable automount.service
systemctl start automount.service

```

Thats all, now you create your own systemd-service!