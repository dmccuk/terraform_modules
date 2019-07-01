#!/bin/bash
sudo apt update -yq
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq
sudo apt install wget curl git python3-minimal -yq
#fix for python3 symlink
#ln -s /usr/bin/python3.5 /usr/bin/python
