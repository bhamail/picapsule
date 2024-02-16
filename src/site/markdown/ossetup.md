OS Setup
========
  
  Once you have an SD Card with the [Raspberry Pi OS](https://www.raspberrypi.com/software/), you can setup the operating system as follows:
  
  1. Insert the card into your Raspberry Pi. Connect the USB Power cable.
  2. Enable `ssh` when the OS boots. You'll likely see the Pi reboot itself after the first startup.
  3. Ensure you are connected to ethernet or configure your Pi to connect to your WiFi network.
  4. `ssh` to your Pi, and update to the latest packages:
     ```shell
     pi@raspberrypi:~ $ sudo apt-get update && sudo apt-get upgrade
     ```    
  5. Change the hostname of your Raspberry Pi. I'm using `raspberrypi-time`. 
     You can do this using `raspi-config` from your `ssh` console. 
     ```shell
     $ sudo raspi-config
     ```
     See: [Change Hostname](https://www.tomshardware.com/how-to/raspberry-pi-change-hostname) for more details.
  6. Reboot your Raspberry Pi and reconnect to it via `ssh`.

Next step: [Time Capsule Setup](timecapsulesetup.html)
