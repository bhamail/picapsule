Automate setup of samba
=======================
1. With all the scripts in the `bin` dir in the same directory, run via:
   ```shell
   sudo ./install-samba-timemachine.sh
   ```
   You will need to provide a password manually for the `timemachine` user.
   You will also need to complete some steps manually after the script completes.

Automate setup of unattended upgrades
=====================================

1. With all the scripts in the `bin` dir in the same directory, run via:
    ```shell
    sudo ./install-auto-upgrade.sh
    ```
2. After successful completion, manually enter your email/password into the file: `/etc/postfix/sasl/sasl_passwd`
3. Perform the remaining commented steps in the `install-auto-upgrade.sh` file to create the postmap db file.
