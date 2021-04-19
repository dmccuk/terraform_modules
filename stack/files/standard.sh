#!/bin/bash

if [ -f /etc/redhat-release ]; then
  echo "######################### UPDATES #############################"
  sudo yum update -y
  echo "######################### INSTALLS #############################"
  sudo yum install wget curl git python3 -y
else
  echo "######################### UPDATES #############################"
  sudo apt update -yq
  echo "######################### INSTALLS #############################"
  sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq
  sudo apt install wget curl git python3-minimal -yq
fi
