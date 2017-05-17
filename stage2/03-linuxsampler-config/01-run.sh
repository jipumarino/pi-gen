#!/bin/bash -e

install -v -m 644 files/autostatic-audio-raspbian.list  ${ROOTFS_DIR}/etc/apt/sources.list.d/autostatic-audio-raspbian.list
install -v -m 644 files/linuxsampler.conf               ${ROOTFS_DIR}/etc/linuxsampler.conf
install -v -m 755 files/linuxsampler-init               ${ROOTFS_DIR}/etc/init.d/linuxsampler
install -v -m 644 files/limits.conf                     ${ROOTFS_DIR}/etc/security/limits.conf
install -v -m 644 files/asound.conf                     ${ROOTFS_DIR}/etc/asound.conf

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

on_chroot << EOF
cd /opt/linuxsampler && unzip SalamanderGrandPianoV3_44.1khz16bit.zip
EOF
