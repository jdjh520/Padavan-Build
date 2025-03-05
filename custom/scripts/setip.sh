#!/bin/sh
lanip=$1
defaultfile=$2
dicfile=$3
oc1=${lanip%%.*}
x=${lanip#*.*}
oc2=${x%%.*}
x=${x#*.*}
oc3=${x%%.*}
dhcpfrom=$oc1"."$oc2"."$oc3".10"
dhcpto=$oc1"."$oc2"."$oc3".150"
sed -i "s/\"192.168.31.1\"/\"$lanip\"/g" $defaultfile
sed -i "s/\"192.168.31.10\"/\"$dhcpfrom\"/g" $defaultfile
sed -i "s/\"192.168.31.150\"/\"$dhcpto\"/g" $defaultfile
sed -i "s/192.168.31.1/$lanip/" $dicfile
