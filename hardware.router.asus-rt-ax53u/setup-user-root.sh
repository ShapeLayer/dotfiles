passwd
opkg update
opkg install shadow-useradd
read -p "New user's username: " username
useradd -r -s /bin/ash $username
passwd $username
mkdir -p /home/$username
chown $username /home/$username
opkg install sudo
echo "$username ALL=(ALL:ALL) ALL" >> /etc/sudoers
passwd -l root
