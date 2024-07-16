WG_INTERFACE=wg0
WG_LAN= # vpn network ip
EN_INTERFACE=enp4s0
CHAIN_NAME="WIREGUARD_$WG_INTERFACE"

iptables -t nat -D POSTROUTING -o $EN_INTERFACE -j MASQUERADE -s $WG_LAN

# Remove and delete the chain
iptables -D FORWARD -j $CHAIN_NAME
iptables -F $CHAIN_NAME
iptables -X $CHAIN_NAME
