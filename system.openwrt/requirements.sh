opkg update
opkg install nano
# OpenWRT is installed BusyBox, shadow package included.
# But shadow package are not found, install manually.
opkg install shadow
