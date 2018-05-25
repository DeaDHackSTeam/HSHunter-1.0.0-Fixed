#! /bin/bash

 bold=`echo -en "\e[1m"`
 underline=`echo -en "\e[4m"`
 dim=`echo -en "\e[2m"`
 strickthrough=`echo -en "\e[9m"`
 blink=`echo -en "\e[5m"`
 reverse=`echo -en "\e[7m"`
 hidden=`echo -en "\e[8m"`
 normal=`echo -en "\e[0m"`
 black=`echo -en "\e[30m"`
 red=`echo -en "\e[31m"`
 green=`echo -en "\e[32m"`
 orange=`echo -en "\e[33m"`
 blue=`echo -en "\e[34m"`
 purple=`echo -en "\e[35m"`
 aqua=`echo -en "\e[36m"`
 gray=`echo -en "\e[37m"`
 darkgray=`echo -en "\e[90m"`
 lightred=`echo -en "\e[91m"`
 lightgreen=`echo -en "\e[92m"`
 lightyellow=`echo -en "\e[93m"`
 lightblue=`echo -en "\e[94m"`
 lightpurple=`echo -en "\e[95m"`
 lightaqua=`echo -en "\e[96m"`
 white=`echo -en "\e[97m"`
 default=`echo -en "\e[39m"`
 BLACK=`echo -en "\e[40m"`
 RED=`echo -en "\e[41m"`
 GREEN=`echo -en "\e[42m"`
 ORANGE=`echo -en "\e[43m"`
 BLUE=`echo -en "\e[44m"`
 PURPLE=`echo -en "\e[45m"`
 AQUA=`echo -en "\e[46m"`
 GRAY=`echo -en "\e[47m"`
 DARKGRAY=`echo -en "\e[100m"`
 LIGHTRED=`echo -en "\e[101m"`
 LIGHTGREEN=`echo -en "\e[102m"`
 LIGHTYELLOW=`echo -en "\e[103m"`
 LIGHTBLUE=`echo -en "\e[104m"`
 LIGHTPURPLE=`echo -en "\e[105m"`
 LIGHTAQUA=`echo -en "\e[106m"`
 WHITE=`echo -en "\e[107m"`
 DEFAULT=`echo -en "\e[49m"`
 
clear

tmpd=/usr/share/bin/HSHunter/tmp
hsd=/usr/share/bin/HSHunter

echo $lightgreen
echo -e "1010101011010100111010"
echo -e "1010101011001110010100"
echo -e "01101101$lightred WPA:KEY$lightgreen 11010$lightred <==$lightgreen [+] Handshake Found!"
echo -e "1010100101010010010101"
echo -e "1001110011101011010011$green Atomated$lightred Wireless Key$green Hacking Tool"
echo -e "                          Find and Crack$lightred Wireless Keys"$lightgreen
echo -e ""
echo -e "[+] Installing HSHunter"
if [ -d /usr/bin/HSHunter ]
then
  cd /usr/bin/
  rm hshunter
  rm -r HSHunter
  echo -e "[+] Successfully Removed Old Installion"
fi
echo -e "[+] Moving Files to /usr/bin/ ..."
cd /root/Desktop/ && chmod 777 HSHunter
cd /root/Desktop/HSHunter && mv installer.sh /root/Desktop/
cd /root/Desktop/ && mv HSHunter /usr/bin/
cp hshunter.sh /usr/bin/hshunter
echo -e "[+] Finish!"
echo -e "[!] hshunter --help program!"
sleep 3
hshunter --help



























