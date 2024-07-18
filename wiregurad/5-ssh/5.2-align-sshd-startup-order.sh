mkdir /etc/systemd/system/sshd.service.d
echo "[Unit]" >> /etc/systemd/system/sshd.service.d/for-wg[n].conf
echo "After=network.target wg-quick@wg0.service" >> /etc/systemd/system/sshd.service.d/for-wg[n].conf
echo "Requires=sys-devices-virtual-net-wg0.device" >> /etc/systemd/system/sshd.service.d/for-wg[n].conf
