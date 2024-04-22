Automate setup of unattended upgrades
=====================================

1. With all the scripts in the `bin` dir in the same directory, run via:
    ```shell
    sudo install-auto-upgrade.sh
    ```
2. After successful completion, manually enter you email/password into the file: `/etc/postfix/sasl/sasl_passwd`
3. Perform the remaining steps commented in the `install-auto-upgrade.sh` file to create the postmap db file.
