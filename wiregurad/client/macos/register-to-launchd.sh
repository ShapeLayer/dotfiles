sudo cp com.wireguard.wg[n].plist /Library/LaunchDaemons
sudo chmod 644 /Library/LaunchDaemons com.wireguard.wg[n].plist
sudo launchctl enable system/com.wireguard.wg[n].plist
sudo launchctl bootstrap system /Library/LaunchDaemons/com.wireguard.wg0.plist
sudo launchctl print system/com.wireguard.wg0
