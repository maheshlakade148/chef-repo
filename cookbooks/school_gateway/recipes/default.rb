

system("nmcli con add type ethernet con-name enp1s6 ifname enp1s6 ip4 192.168.100.254/16 ")
system("nmcli con add type ethernet con-name enp1s7 ifname enp1s7 ip4 125.99.69.97/30  gw4 125.99.69.99")
system("nmcli con mod enp1s7 ipv4.dns '8.8.8.8 125.99.61.254 116.72.253.254'")

system("sed -i 's/IPV4_FAILURE_FATAL=no/IPV4_FAILURE_FATAL=yes/' /etc/sysconfig/network-scripts/enp1s6")
system("sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/enp1s6")

system("sed -i 's/IPV4_FAILURE_FATAL=no/IPV4_FAILURE_FATAL=yes/' /etc/sysconfig/network-scripts/enp1s7")
system("sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/enp1s7")

system("echo 'ZONE=external' >> /etc/sysconfig/network-scripts/enp1s7")
system("echo 'ZONE=internal' >> /etc/sysconfig/network-scripts/enp1s6")
#system("uniq /etc/sysconfig/network-scripts/enp2")
#system("uniq 'ZONE=internal' >> /etc/sysconfig/network-scripts/enp1")


system("ip route replace default via 125.99.69.96 dev enp1s7 proto static metric 1024")

system("sed -i 's/net.ipv4.ip_forward=0/net.ipv4.ip_forward=1/' /etc/sysctl.conf")
system("sysctl -p")

system("firewall-cmd --zone=external --add-masquerad --permanent")

