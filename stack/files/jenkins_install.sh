#!/bin/bash
# Installing Jenkins:
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo echo 'deb http://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get -y install default-jre
sudo apt-get -y install jenkins
sudo systemctl start jenkins
echo " ---## Jenkins Installed ##---"
