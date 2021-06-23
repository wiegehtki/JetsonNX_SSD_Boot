#!/bin/bash
# Als erstes mounten wir die SSD
# Normalerweise sollte die SSD als nvme0n1p1 erscheinen
# Das kann mittels ls /dev/nvm* kontrolliert werden

if [ "$(whoami)" != "root" ]; then
    ColErr="\033[1;31m"
    NoColErr="\033[0m"
    echo -e ${ColErr} "Benutzer muss root sein, Abbruch..." ${NoColErr}
    exit 255
else
    mount /dev/nvme0n1p1 /mnt

    # Nun kopieren wir die Installation der SD - Karte auf die SSD
    rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt

    # Jetzt noch die notwendigen Services auf die SSD umbiegen
    cp services4ssd/setssdrootfs.service /etc/systemd/system
    cp services4ssd/setssdrootfs.sh /sbin
    chmod 777 /sbin/setssdrootfs.sh
    systemctl daemon-reload
    systemctl enable setssdroot.service

    # Copy these over to the SSD
    cp /etc/systemd/system/setssdrootfs.service /mnt/etc/systemd/system/setssdrootfs.service
    cp /sbin/setssdrootfs.sh /mnt/sbin/setssdrootfs.sh

    # Create setssdroot.conf which tells the service script to set the rootfs to the SSD
    # If you want to boot from SD again, remove the file /etc/setssdroot.conf from the SD card.
    # touch creates an empty file
    touch /etc/setssdroot.conf
    echo "SD - Service installiert."
    echo "Bitte Jetson neu starten."
if 
