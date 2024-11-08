#!/bin/sh

# note: generated expect script using 'autoexpect', but first had to install 'expect'...chickens and eggs and such

# install unattended upgrades
# see: https://www.matt-black.tech/posts/Unattended-Upgrades-with-Email-Notifications-Keeping-Your-Raspberry-Pi-Secure/

sudo apt install unattended-upgrades -y

# Enable unattended-upgrades to run automatically
# Hm, was already configured to run automatically on bookworm (debian 12)
#sudo dpkg-reconfigure --priority=low unattended-upgrades

# edit: /etc/apt/apt.conf.d/50unattended-upgrades to allow regular package updates from the Debian archive
# uncomment the line in /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's|\/\/.*      "origin=Debian,codename=${distro_codename}-updates";|        "origin=Debian,codename=${distro_codename}-updates";|' /etc/apt/apt.conf.d/50unattended-upgrades
# add Raspian repos
sudo sed -i 's|"origin=Debian,codename=${distro_codename}-security,label=Debian-Security";|"origin=Debian,codename=${distro_codename}-security,label=Debian-Security";\n        "origin=Raspbian,codename=${distro_codename},label=Raspbian"; // this line enables non-security updates labeled as "Raspbian" from the Raspbian archive\n        "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation"; // this line enables non-security updates labeled as "Raspberry Pi Foundation" from the Raspberry Pi Foundation archive|' /etc/apt/apt.conf.d/50unattended-upgrades

# enable auto reboot
sudo sed -i 's|//Unattended-Upgrade::Automatic-Reboot "false";|Unattended-Upgrade::Automatic-Reboot "true";|' /etc/apt/apt.conf.d/50unattended-upgrades

# enable email notifications (requires later postfix setup)
sudo sed -i 's|//Unattended-Upgrade::Mail "";|Unattended-Upgrade::Mail "cibuildfarm@gmail.com";|' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's|//Unattended-Upgrade::MailReport "on-change";|Unattended-Upgrade::MailReport "always";|' /etc/apt/apt.conf.d/50unattended-upgrades


# postfix setup
#sudo apt install postfix -y
sudo apt install expect -y
sudo ./install-postfix-expect.exp

# setup relayhost
sudo sed -i 's|relayhost = |relayhost = [smtp.gmail.com]:587|' /etc/postfix/main.cf
# smtp config
sudo sed -i 's|smtp_tls_security_level=may|#smtp_tls_security_level=may|' /etc/postfix/main.cf
sudo sed -i 's|inet_protocols = all|inet_protocols = all\n\n# Enable SASL authentication\nsmtp_sasl_auth_enable = yes\nsmtp_sasl_security_options = noanonymous\nsmtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd\nsmtp_tls_security_level = encrypt\nsmtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt\n|' /etc/postfix/main.cf

sudo touch /etc/postfix/sasl/sasl_passwd
# TODO you need to create and edit this file with your own email/password info
echo '[smtp.gmail.com]:587 your-email@gmail.com:your-app-password' | sudo tee -a /etc/postfix/sasl/sasl_passwd > /dev/null

echo 'Looks good so far. Now you have some manual steps to do: '
echo 'The correct email and password need to be in place before setting up the Postmap db. Edit: /etc/postfix/sasl/sasl_passwd, then:'
echo '# sudo postmap /etc/postfix/sasl/sasl_passwd'
echo '# sudo chown root:root /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db'
echo '# sudo chmod 0600 /etc/postfix/sasl/sasl_passwd /etc/postfix/sasl/sasl_passwd.db'
echo '# sudo systemctl restart postfix'
echo '# sudo unattended-upgrades -d'
