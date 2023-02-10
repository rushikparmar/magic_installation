#!/bin/bash
Log_File=./installation.log


CommandLog () {
author='rushik_parmar'
startdate=$(date)
scriptName='magic_installation.log'

echo "${author}"
echo "[$startdate]:[INSTALLATION]: This is ${scriptName}, which shows the loging of magic_installation.sh:"

echo "=============================================="
echo "----Basic Update----"
echo "=============================================="


sudo apt-get update -y

echo "=============================================="
echo "----Magic Installation----"
echo "=============================================="
sudo apt-get install magic -y

echo "=============================================="
echo "----2002a Library Installation----"
echo "=============================================="
wget opencircuitdesign.com/magic/archive/2002a.tar.gz
tar -zxf 2002a.tar.gz
mv 2002a current
sudo chown -R $USER: current/
sudo rm 2002a.tar.gz

echo "=============================================="
echo "----Copying extracted library to magic folder----"
echo "=============================================="

sudo cp -r --verbose current/ /usr/lib/x86_64-linux-gnu/magic/sys/

echo "=============================================="
echo "----Installation Complete----"
echo "=============================================="

} 


CommandLog | tee "${Log_File}"
#ErrorLog "Found error in logic to logging for investigation" | tee "${Log_File}"
	
