cd [/etc/wireguard | /opt/homebrew/etc/wireguard]
wg genkey | tee privatekey-[target] | wg pubkey > publickey-[target]
