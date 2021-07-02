#!/bin/bash
# Wirklich root?
if [ "$(whoami)" != "root" ]; then
    ColErr="\033[1;31m"
    NoColErr="\033[0m"
    echo -e ${ColErr} "Benutzer muss root sein, Abbruch..." ${NoColErr}
    exit 255
else
    # Als erstes mounten wir die SSD
    # Normalerweise sollte die SSD als nvme0n1p1 erscheinen (das kann mittels ls /dev/nvm* kontrolliert werden)
    if [ ! -d "/mnt/nvme" ]; then mkdir /mnt/nvme; fi
    if [   -f "/dev/nvme0n1" ]; then mount /dev/nvme0n1 /mnt/nvme; fi
    if [   -f "/dev/nvme0n1p1" ]; then mount /dev/nvme0n1p1 /mnt/nvme; fi
  
    if mountpoint -q /mnt/nvme; then
        # Nun kopieren wir die Installation der SD - Karte auf die SSD
        rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt/nvme

        # Jetzt noch die notwendigen Services auf die SSD umbiegen
        cp services4ssd/setssdrootfs.service /etc/systemd/system
        cp services4ssd/setssdrootfs.sh /sbin
        chmod 777 /sbin/setssdrootfs.sh
        systemctl daemon-reload
        systemctl enable setssdrootfs.service

        cp /etc/systemd/system/setssdrootfs.service /mnt/nvme/etc/systemd/system/setssdrootfs.service
        cp /sbin/setssdrootfs.sh /mnt/nvme/sbin/setssdrootfs.sh

        # setssdrootfs.conf anlegen, dadurch wird der Service von der SSD arbeiten
        # Um wieder von der SD zu booten, einfach /etc/setssdroot.conf löschen
        touch /etc/setssdrootfs.conf
        echo "SSD - Service wurde installiert."
        echo "Bitte Jetson neu starten."
    else
	    echo -e ${ColErr} "SSD - M.2 - Device nicht gefunden. Partition aktiv? (mount, siehe Disks). Abbruch..." ${NoColErr}
        exit 255
    fi	
fi 
