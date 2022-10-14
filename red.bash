#!/bin/bash

for  i in {1..254}
do
  os="Windows"
  pingResponse="$(ping -n 1 192.168.0.$i)"

  
  if echo $pingResponse | grep 'TTL' >> /dev/null; then
    case "$pingResponse" in *TTL=64*)
      os="Linux/Android"
    esac
    case "$i" in "1")
      os="Router"
    esac
    
    echo -e "================================
      IP: 192.168.0.$i / ACTIVA \n
      OS: $os \n"
  else
    continue
  fi
done