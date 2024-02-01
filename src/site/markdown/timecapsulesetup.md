Time Capsule Setup
==================

To mimic a Time Capsule, we need a [NAS (network-attached storage) Drive](https://en.wikipedia.org/wiki/Network-attached_storage). 
This is basically a drive that is shared on the network in a manner that allows other computers on the network to read 
and write to the shared disk.

The protocol used to share this disk will be Server Message Block (SMB - aka: Samba). To make it easier for 
Apple Time Machine to find this disk, we will make it advertise itself as a Time Capsule.

1. Use `ssh` to connect to your Raspberry Pi:
    ```shell
    ssh pi@raspberrypi-time
    ```

2. Follow these instructions to install Samba, and connect your USB hard drive:
   [Use a Raspberry Pi 4 for Time Machine Backups](https://saschaeggi.medium.com/use-a-raspberry-pi-4-for-time-machine-works-with-big-sur-1e66a9650789).

   The above instructions do not go into great detail about how to format and mount your external USB
   drive on the Pi, so I found this page helpful:  
   [Format USB Drive](https://raspberrytips.com/format-mount-usb-drive/) -> See: "Format USB drives with a command line".   
   
   As an example, here's the contents of `/etc/fstab` on my `raspberrypi-time` host:
   ```shell
   # added by Dan for TimeMachine backups
   # https://raspberrytips.com/format-mount-usb-drive/
   # https://saschaeggi.medium.com/use-a-raspberry-pi-4-for-time-machine-works-with-big-sur-1e66a9650789
   UUID=73c1affc-d29c-4246-969e-adf90d71a23e /mnt/timemachine ext4 sync,noexec,nodev,noatime,nodiratime 0 0
   ```

3. Since this Raspberry Pi is most likely headless, and you never really directly interact with it,
   you should have it setup to email you about its status. You should also setup this Pi to automatically 
   update itself every night with the latest software patches available. 
   See: [Unattended Upgrades with Email Notifications](https://www.matt-black.tech/posts/Unattended-Upgrades-with-Email-Notifications-Keeping-Your-Raspberry-Pi-Secure/)

Many thanks to the authors of the above links!

Next step: [Doc docs](docdocs.html)
