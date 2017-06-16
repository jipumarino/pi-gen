#!/bin/bash -e

install -v -m 644 files/autostatic-audio-raspbian.list  ${ROOTFS_DIR}/etc/apt/sources.list.d/autostatic-audio-raspbian.list
install -v -m 644 files/linuxsampler.conf               ${ROOTFS_DIR}/etc/linuxsampler.conf
install -v -m 755 files/linuxsampler-init               ${ROOTFS_DIR}/etc/init.d/linuxsampler
install -v -m 644 files/limits.conf                     ${ROOTFS_DIR}/etc/security/limits.conf
install -v -m 644 files/asound.conf                     ${ROOTFS_DIR}/etc/asound.conf
install -v -m 644 files/sound-modprobe.conf             ${ROOTFS_DIR}/etc/modprobe.d/50-sound.conf
install -v -m 644 files/udev-local.rules                ${ROOTFS_DIR}/etc/udev/rules.d/10-local.rules
install -v -m 755 files/connect_midi_devices.sh         ${ROOTFS_DIR}/opt/connect_midi_devices.sh
install -v -m 644 files/fstab-readonly                  ${ROOTFS_DIR}/etc/fstab


on_chroot << EOF
wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | apt-key add -
apt-get update
apt-get install -y linuxsampler
touch /var/log/linuxsampler.log
systemctl set-default multi-user.target
systemctl daemon-reload
update-rc.d linuxsampler defaults
EOF

install -d            ${ROOTFS_DIR}/opt/linuxsampler
install -v -m 644     files/SalamanderGrandPianoV3_44.1khz16bit.zip       ${ROOTFS_DIR}/opt/linuxsampler/SalamanderGrandPianoV3_44.1khz16bit.zip
install -v -m 644     TaijiguyGigaTron_switched.gig                       ${ROOTFS_DIR}/opt/linuxsampler/TaijiguyGigaTron_switched.gig

on_chroot << EOF
cd /opt/linuxsampler && unzip -o SalamanderGrandPianoV3_44.1khz16bit.zip
EOF
