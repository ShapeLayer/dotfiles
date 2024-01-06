# OpenWrt for ASUS RT-AX53U has WAN interface issue with version 23.05.0.
# This script installs OpenWrt version 22.03.5.
# For more information or checking fixed stable release, visit https://openwrt.org/toh/asus/rt-ax53u

# Installation with mtd-write
# 1. Go to Administration settings in the web interface and enable ssh access.
# 2. Connect to ssh and login by using the same credentials you used to login to the web interface
#    (user is usually `admin`).
# 3. Download the factory image to the filesystem.
wget https://downloads.openwrt.org/releases/22.03.5/targets/ramips/mt7621/openwrt-22.03.5-ramips-mt7621-asus_rt-ax53u-squashfs-factory.bin
# 4. Flash the image to Kernel partition.
mtd-write -i openwrt-22.03.5-ramips-mt7621-asus_rt-ax53u-squashfs-factory.bin -d Kernel
# 5. Reboot the device. If you do the graceful reboot there is a chance that the kernel will panic and the router won't reboot. In this case just perform a forceful reboot with a physical button or power cycle the device.
# 6. The device should now boot OpenWrt.
