#!/bin/sh
# Schaltet beim Starten das rootfs auf die M.2 NVMe SSD um
NVME_DRIVE="/dev/nvme0n1"
CHROOT_PATH="/nvmeroot"

INITBIN=/lib/systemd/systemd
EXT4_OPT="-o defaults -o errors=remount-ro -o discard"

modprobe ext4

mkdir -p ${CHROOT_PATH}
mount -t ext4 ${EXT4_OPT} ${NVME_DRIVE} ${CHROOT_PATH}

cd ${CHROOT_PATH}
/bin/systemctl --no-block switch-root ${CHROOT_PATH}
