#!/bin/bash
# Installing Jenkins:
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo echo 'deb http://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt install wget curl git python3-minimal ansible -yq
#fix for python3 symlink
ln -s /usr/bin/python3.5 /usr/bin/python
sudo apt-get -y install default-jre
sudo apt-get -y install jenkins
sudo systemctl start jenkins
echo " ---## Jenkins Installed ##---"
