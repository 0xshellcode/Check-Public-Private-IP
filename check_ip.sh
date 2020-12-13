#!/bin/bash
check_ip() {

  if [ $? -eq 0 ]; then
      public_ip=$(lynx -source ipinfo.io/ip)
      country=$(lynx -source ipinfo.io/country)
      echo -e "\e[25;91mYour public IP is: \e[5;92m$public_ip | \e[5;92m$country"
  else
        echo -e "\e[5;91mNo public IP (Offline)"
  fi

  private_ip=$(ifconfig wlp4s0 |grep netmask | awk -F "inet " {'print $2'} | cut -d ' ' -f1)
  echo -e "\e[25;91mYour private IP is: \e[5;92m$private_ip"

}
  check_ip
