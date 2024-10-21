Automate setup of unattended upgrades
=====================================

1. With all the scripts in the `bin` dir in the same directory, run via:
    ```shell
    sudo ./install-auto-upgrade.sh
    ```
2. After successful completion, manually enter your email/password into the file: `/etc/postfix/sasl/sasl_passwd`
3. Perform the remaining commented steps in the `install-auto-upgrade.sh` file to create the postmap db file.
