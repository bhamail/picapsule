OS Setup
========
  
  Once you have an SD Card with the [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) OS Image, you can setup the operating system as follows:
  
  1. Insert the card into your Raspberry Pi. Connect the USB Power cable.
  2. Enable `ssh` when the OS boots. You'll likely see the Pi reboot itself after the first startup.
  3. Ensure you are connected to ethernet or configure your Pi to connect to your WiFi network.
  4. `ssh` to your Pi, and update to the latest packages:
     ```shell
     pi@raspberrypi:~ $ sudo apt-get update && sudo apt-get upgrade
     ```    
Next step: [Time Capsule Setup](nexussetup.html)
