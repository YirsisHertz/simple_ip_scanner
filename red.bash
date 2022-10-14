#!/bin/bash

for  i in {1..254}
do
  os="Windows"
  pingResponse="$(ping -n 1 $1.$i)"

  
  if echo $pingResponse | grep 'TTL' >> /dev/null; then
    case "$pingResponse" in *TTL=64*)
      os="Linux/Android"
    esac
    case "$i" in "1")
      os="Router"
    esac
    
    echo -e "==========================================
      IP: $1.$i / ACTIVA \n
      OS: $os \n"
  else
    echo "Die: $1.$i"
    continue
  fi
done
