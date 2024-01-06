useradd -m -s /bin/ash $ACCOUNT_NAME -r
echo $PASSWROD | passwd --stdin $ACCOUNT_NAME
cat ./resources/sudoers >> /etc/sudoers
passwd -l root
cat ./resources/rcpd >> /etc/config/rcpd
# cat ./resources/wireless >> /etc/config/wireless
