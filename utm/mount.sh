sudo mkdir /media/host
sudo mount -t 9p -o trans=virtio share /media/host -oversion=9p2000.L
sudo sh -c 'echo "share /media/host 9p trans=virtio,version=9p2000.L,rw,_netdev,nofail 0 0" >> /etc/fstab'
sudo reboot
