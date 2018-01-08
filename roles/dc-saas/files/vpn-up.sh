#!/bin/bash

declare -A vpn_ips=( ["5.6.0.51"]="5.6.0.101" ["5.6.0.52"]="5.6.0.102" ["5.6.0.53"]="5.6.0.103" ["5.6.0.54"]="5.6.0.104" ["5.6.0.55"]="5.6.0.105" ["5.6.0.56"]="5.6.0.106" ["5.6.0.57"]="5.6.0.107" ["5.6.0.58"]="5.6.0.108" ["5.6.0.59"]="5.6.0.109" ["5.6.0.60"]="5.6.0.110" )

TUNNEL_IP=$4
echo "Tunnel IP is $TUNNEL_IP"
echo "Remote IP is ${vpn_ips[$TUNNEL_IP]}"

/usr/sbin/ip route add default via ${vpn_ips[$TUNNEL_IP]} table 5
/usr/sbin/ip rule add fwmark 2 table 5

