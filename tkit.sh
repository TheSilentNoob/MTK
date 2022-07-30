#!/bin/bash

white='\033[97m'
green='\033[92m'
RED='\033[91m'
yellow='\033[93m'
end='\033[0m'
info='\033[93m[!] \033[0m'
que='\033[94m[?] \033[0m'
bad='\033[91m[-] \033[91m'
good='\033[32m[+] \033[92m'
run='\033[97m[~] \033[0m'
blue='\033[94m'

if [ $1 == "-i" ]; then
  bash install.sh
  if [ bash install.sh ]; then
    printf "${good}"
    echo " Successful installation ! Enjoy !"
    sleep 2
  else
    printf "${bad}"
    echo " Failed Install please read Error message and fix it ! "
    sleep 2
    exit
  fi
else
  pass
fi

function banner(){ 
clear
printf "${white}"
figlet -w 200 -f standard "Tool Kit"

echo "

        1. Send Messages
        2. Bluetooth attack
        3. ARP and MAC spoofing

"
read -p "TKit > " input

}
while :
do
  banner
  if [ $input == 1 ]; then
    python3 core/Fast-Message/message.py
    if [ Fast-Message/message.py < /dev/null ]; then
      printf "${RED}"
      printf "${bad}"
      echo " FATAL ERROR : You do not installed requirements please do bash install.sh or ./tkit.sh -i !"
      printf "${white}"
      sleep 3
      exit
    fi
  elif [ $input == 2 ]; then
    bash BlueSpoof/core/spoof.sh
  else
    printf "${RED}"
    echo " FATAL ERROR : This isn't a available option . Please retry with a correct options ."
    sleep 2
  fi
done
