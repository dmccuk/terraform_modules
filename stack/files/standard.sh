#!/bin/bash
sudo apt update -yq
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq
sudo apt install wget curl git python3-minimal -yq
