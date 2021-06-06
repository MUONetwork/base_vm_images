#!/usr/bin/env bash

set -eux

#echo "Hate netplan and its dhcpclient.. Removing it and going back to ifupdown"
#apt -y install ifupdown
#apt -y purge netplan.io
#rm -rf /etc/netplan
#echo "Going back to ethX based interface names"
#sed -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
#grub-mkconfig -o /boot/grub/grub.cfg
#
#cat > /etc/network/interfaces <<EOF
#auto eth0
#iface eth0 inet dhcp
#EOF

echo "Starting cleanup"
apt-get -y autoremove
apt-get -y clean
rm -rf /tmp/

echo "Truncate bash history"
unset HISTFILE
truncate -s0 /root/.bash_history
for dir in /home/*/     # list directories in the form "/home/"
do
  truncate -s0 "${dir%*/}/.bash_history"
  #dir=${dir%*/}      # remove the trailing "/"
done

echo "Remove dhcp leases"
rm -rf /var/lib/dhcp/*

echo "Truncate machine-id"
truncate -s0 /etc/machine-id

# echo "Netplan change dhcp-identifier to mac"
# sed -i 's/^#*\(send dhcp-client-identifier\).*$/\1 = hardware;/' /etc/dhcp/dhclient.conf
# sed -i "s/dhcp4: yes/&\n      dhcp-identifier: mac\n      dhcp4-overrides:\n        send-hostname: yes\n/" /etc/netplan/01-netcfg.yaml

exit 0
