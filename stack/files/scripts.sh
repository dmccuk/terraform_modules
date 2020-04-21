#/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# Installing Gitlab:
sudo apt update -yq
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq
sudo apt install wget curl git python -yq
