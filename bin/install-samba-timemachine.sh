#!/bin/sh

# install samba and configure timemachine user for use with macOS Time Machine
# see: https://saschaeggi.medium.com/use-a-raspberry-pi-4-for-time-machine-works-with-big-sur-1e66a9650789

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install samba avahi-daemon
sudo adduser timemachine

# set the password for the timemachine user
# a human needs to provide this value at the prompt
sudo smbpasswd -a timemachine

sudo mkdir /mnt/timemachine
# assumes use of nvme drive on Pi 5
sudo mount /dev/nvme0n1p1 /mnt/timemachine
sudo chown -R timemachine: /mnt/timemachine

# add time machine share to samba config
sudo sed -i 's|;   write list = root, @lpadmin|;   write list = root, @lpadmin\n\n# Added for picapsule timeamachine share\n[backups]\n    comment = Backups\n    path = /mnt/timemachine\n    valid users = timemachine\n    read only = no\n    vfs objects = catia fruit streams_xattr\n    fruit:time machine = yes\n|' /etc/samba/smb.conf
# test samba config
sudo testparm -s
# restart samba service
sudo service smbd reload

# configure avahi daemon to show this share as an 8th gen time machine
sudo cp ./samba.service /etc/avahi/services/samba.service
sudo service avahi-daemon restart

# determine the device ID of the time machine drive
ls -lha /dev/disk/by-uuid
# TODO automate the stuff below
echo 'Looks good so far. Now you have some manual steps to do: '
echo 'Find the device ID above of your time machine drive, then:'
echo 'Add that device ID to your /etc/fstab, like:'
echo 'UUID=7efbdfc5–9c85–4e01–873a-204e00c9aa45 /mnt/timemachine ext4 sync,noexec,nodev,noatime,nodiratime 0 0'
