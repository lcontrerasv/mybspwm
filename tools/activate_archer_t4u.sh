#!/bin/bash
#
# Activate TP-Link Wireless adapter Archer T4U
#

#Colors
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  greenColour="\e[0;32m\033[1m"
  endColour="\033[0m\e[0m"
  redColour="\e[0;31m\033[1m"
  blueColour="\e[0;34m\033[1m"
  yellowColour="\e[0;33m\033[1m"
  purpleColour="\e[0;35m\033[1m"
  turquoiseColour="\e[0;36m\033[1m"
  grayColour="\e[0;37m\033[1m"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  greenColour="\x1B[0;32m\033[1m"
  endColour="\033[0m\x1B[0m"
  redColour="\x1B[0;31m\033[1m"
  blueColour="\x1B[0;34m\033[1m"
  yellowColour="\x1B[0;33m\033[1m"
  purpleColour="\x1B[0;35m\033[1m"
  turquoiseColour="\x1B[0;36m\033[1m"
  grayColour="\x1B[0;37m\033[1m"
else
  #No colors
  greenColour=""
  endColour=""
  redColour=""
  blueColour=""
  yellowColour=""
  purpleColour=""
  turquoiseColour=""
  grayColour="" 
fi

# Need to be root

if [ "$(id -u)" == "0" ]; then
    echo -e "\n${yellowColour}[*]${endColour}${grayColour} Installing driver for${endColour}${blueColour} TP-Link Archer T4U... ${endColour}"
    sudo apt install -y realtek-rtl88xxau-dkms > /dev/null 2>&1

    if [[ "$(echo $?)" == "0" ]]; then
        sudo modprobe -a 88XXau > /dev/null 2>&1

        if [[ "$(echo $?)" == "0" ]]; then
          echo -e "\n${greenColour}[*]${endColour} Driver installed success!"
        else
          echo -e "\n${redColour}[!]${endColour} Error loading driver!"
        fi
    else
        echo -e "\n${redColour}[!]${endColour} Error installing driver!"
    fi
else
    echo -e "\n${redColour}[!] Stop! You need to be root${endColour}\n"
fi
