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
## Arguments/commands ##
command=$1
filename=$2
wordlist=$3
tmpd=/usr/bin/HSHunter/tmp
hsd=/usr/bin/HSHunter
## End Of Args ##
## Fuctions ##
aircrackcheck(){
       aircrack-ng $filename > $tmpd/aircrack.txt
       cd $tmpd && grep -i "1 handshake" aircrack.txt > aircrack2.txt || echo No Handshakes Founds > failaircrack.txt
}
wordlistcrack(){
       aircrack-ng $filename -w $wordlist 
}
## end fuctions ##

echo $lightgreen
echo -e "1010101011010100111010"
echo -e "1010101011001110010100"
echo -e "01101101$lightred WPA:KEY$lightgreen 11010$lightred <==$lightgreen [+] Handshake Found!"
echo -e "1010100101010010010101"
echo -e "1001110011101011010011$green Atomated$lightred Wireless Key$green Hacking Tool"
echo -e "                          Find and Crack$lightred Wireless Keys"$lightgreen
echo -e ""
case "$1" in
    --help)
    echo $normal
    echo -e "--help$lightgreen /$normal Will Display Help Menu"
    echo -e "$green====================================$lightred Handshake Cracking$green ====================================="$normal
    echo -e "--check$lightgreen /$lightred --check <.cap file>$lightgreen /$normal HSHunter Will Check .cap File For WPA/WPA2/WEP Encryption Key"
    echo -e "--crack ( WPA / WPA2 Only )$lightgreen /$lightred --crack <.cap file> <wordlist>$lightgreen /$normal HSHunter Will Launch A Dictionary Based-Attack To Hopefully Decrypt The Key"
    echo -e "--john-crack$lightgreen /$lightred --john-crack <.cap file> <wordlist>$lightgreen /$normal HSHunter Will Setup John And Launch A Disctionary Based-Attack To Hopefully Decrypt The Key "
    echo -e "--command-crack$lightgreen /$normal Will Display Cracking Commands With Different Password Cracking Tool"
    echo -e "$green=====================================$lightgreen WiFi Cracking$green ========================================="$normal
    echo -e "wifi-hack - Soon In 1.4.0 Version"
    echo -e "$green===================================$lightgreen WPA$lightred WiFi Cracking$green ======================================="$normal
    echo -e "--wpa-hack - Soon In 1.4.0 Version"
    echo -e "$green===================================$lightgreen WPS$lightred WiFi Cracking$green ======================================="$normal
    echo -e "--wps-hack - Soon In 1.4.0 Version"
    echo -e "$green===================================$lightgreen WEP$lightred WiFi Cracking$green ======================================="$normal
    echo -e "--wep-hack - Soon In 1.4.0 Version"
    echo -e "$green======================================$lightyellow Misc/Usefull$green ========================================="$normal
    echo -e "--wireshark-read$lightred / --wireshark-read <.cap file>$lightred /$normal Will Read .cap File With Wireshark"
    echo -e "--about$lightgreen /$normal Will Display Informations About HSHunter"
    echo -e "--version$lightgreen $normal Will Display Version"
    ;;
    --check)
    echo -e "$lightgreen[+] Checking File For Handshake(s)..."
    echo -e "$blue[i] Listing Results."
    aircrackcheck
    echo -e "$green+++++++++++++$blue Aircrack-ng$green +++++++++++"
    echo -e "Aircrack-ng Result:$lightgreen"
    cd $tmpd && cat aircrack2.txt 
    cat failaircrack.txt > /dev/null 2>&1
    rm aircrack2.txt > /dev/null 2>&1
    rm failaircrack.txt > /dev/null 2>&1
    rm aircrack.txt > /dev/null 2>&1
    echo -e "$green++++++++++++++++++++++++++++++++++++++++++++++++"
    echo -e "$lightgreen[+] Finish Checking!" 
    echo -e "$lightgreen[✔] Thank you for using HSHunter!" 
    echo ;;
    --crack)
    echo -e "$lightgreen[+] Preparing Crack..."
    echo -e "$blue[i] Launching!"
    sleep 2
    wordlistcrack 
    echo -e "$lightgreen[+] Finish Cracking!" 
    echo -e "$lightgreen[✔] Thank you for using HSHunter!" 
    echo
    ;;
    --john-crack) 
    echo -e "[+] Wait The Hell Up! HSHunter needs to setup everything, like always..."
    aircrack-ng -J johncrack $filename > /dev/null 2>&1 || echo -e [X] Error: Seems File Doesn't' Exist. | exit
    echo -e "[i] 48% Done... : Formating To .hccap Format."
    hccap2john $hsd/johncrack.hccap > $tmpd/johncrack.john
    echo -e "[i] 99% Done... : Formating To .john Format."
    echo 
    echo -e "[i] 99.9% Done... : Removing Junk Files."
    cd /root/Desktop/HSHunter/ && rm johncrack.hccap
    echo -e "[+] 100% Done... : Launching John."
    john $tmpd/johncrack.john --wordlist=$wordlist --format=wpapsk
    echo -e "$lightgreen[+] Finish Cracking With John!" 
    echo -e "$lightgreen[✔] Thank you for using HSHunter!" 
    cd $tmpd && rm johncrack.john
    echo
    ;;
    --command-crack)
    echo -e "$lightred[!] Make sure your file is a .cap file."$green    
    echo -e "Command For Key Cracking:"$lightred
    echo 
    echo -e "HashCat$lightgreen:"
    echo -e "aircrack-ng -J hashcatcrack /path/to/.cap/file"
    echo -e "hashcat -a 0 -m 2500 hashcatcrack.hccap /path/to/wordlist/$lightblue # Feel free to change the mode next to '-a' check hashcat for modes."
    echo $lightred
    echo -e "John / Johnny The Ripper$lightgreen:"
    echo -e "aircrack-ng -J johntherippercrack /path/to/.cap/file"
    echo -e "hccap2john johntherippercrack.hccap /root/Desktop/johntheripper.john"
    echo -e "john /root/Desktop/johntheripper.john --wordlist=/path/to/wordlist/ --format=wpapsk$lightblue # John cracks password via GPU Power, change format if any of this situation fits you: "
    echo -e "Nvidia GPU : --format=wpapsk-cuda"
    echo -e "OpenCL GPU / CPU : --format=wpapsk-opencl"
    echo -e "Default : --format=wpapsk"
    echo -e $lightred
    echo -e "Aircrack-ng$lightgreen:"
    echo -e "aircrack-ng /path/to/.cap/file -w /path/to/wordlist/"
    echo -e $lightred
    echo -e "Pyrit$lightgreen:"
    echo -e "pyrit -i /path/to/wordlist -r /path/to/.cap/file attack_passthough"
    echo -e $lightred
    echo -e "Cowpatty$lightgreen:"
    echo -e "cowpatty -f /path/to/wordlist/ -r /path/to/.cap/file"
    echo -e "$lightblue# Optional command:"$lightgreen
    echo -e "cowpatty -f /path/to/wordlist/ -r /path/to/.cap/file -s <name of the wifi / essid>"
    echo -e ""
    echo -e "$green[+] Hopefully those commands helps you further!"
    echo
    ;;
    --wireshark-read)
    echo -e "$lightgreen[+] Finding File..."
    echo -e "$lightgreen[+] Ok launching Wireshark!"
    wireshark $filename
    echo -e "$lightgreen[+] Finish Reading Packet With Wireshark!" 
    echo -e "$lightgreen[✔] Thank you for using HSHunter!" 
    ;;
    --about)
    echo $lightgreen
    echo -e "HSHunter - HandshakeHunter "
    echo -e "Is a$lightred Atomated Wireless Key Hacking Tool$lightgreen for$lightblue Kali Linux."$lightgreen
    echo -e "Powerfull and Quick HSHunter is easy and fast for WiFi Beginner hacking."
    echo -e "Why HSHunter?"
    echo -e "Well HSHunter isn't has good as Wifite, Fern etc...."
    echo -e "But a good and powerfull tool. Recommended for quick and good wireless key hacking tool."$green
    echo -e ""
    echo -e "MESSAGE FROM CREATOR: Hello, i'm Ghosty the creator of HSHunter. I made this tool when i was using Wifite."
    echo -e "I though of doing a tool that can check for handshakes since Wifite only checks HIS previous captured handshakes."
    echo -e "So i did HSHunter though i lost the save of the file...so i had to redo it, what's new you would ask?"
    echo -e "This script has commands! Like --help etc which is special to me since its my first script equiped with custom commands!"
    echo -e "Then i had ideas to make a cracker then it was going more far with auto-wifi hacking which in this version 1.0.0 i'm working on."
    echo -e "Hopefully you love my tool and share it! Goal: HSHunter impleted in Kali Linux by default!"
    echo 
    echo -e "Report Bugs / Suggestions?: gmail: deadhacksteam@gmail.com / YouTube: DeaDHackS Team / github: deadhacks / deadhacksteam."
    echo
    ;;
    --version) echo $green
    echo -e "Name:$lightred HSHunter"$green
    echo -e "Version:$lightred 1.0.0"$green
    echo -e "Next Version:$lightred 1.4.0"$green
    echo
    ;;
    *)
    echo -e "$lightred[X] Error: Command Seems To Be Wrong. Please recheck your command and try again."
    echo -e "$blue[i] --help To display commands."
    ;;
esac

































