WG_INTERFACE=wg0
WG_LAN= # vpn network ip
EN_INTERFACE=enp4s0
CHAIN_NAME="WIREGUARD_$WG_INTERFACE"

iptables -t nat -I POSTROUTING -o $EN_INTERFACE -j MASQUERADE -s $WG_LAN

iptables -N $CHAIN_NAME
iptables -A FORWARD -j $CHAIN_NAME

# Accept related or established traffic
iptables -A $CHAIN_NAME -o $WG_INTERFACE -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Accept traffic from any Wireguard IP address connected to the Wireguard server
iptables -A $CHAIN_NAME -s $WG_LAN -i $WG_INTERFACE -j ACCEPT

# Drop everything else coming through the Wireguard interface
iptables -A $CHAIN_NAME -i $WG_INTERFACE -j DROP

# Return to FORWARD chain
iptables -A $CHAIN_NAME -j RETURN
