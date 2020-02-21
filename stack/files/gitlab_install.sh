#/bin/bash
set -x
# Installing Gitlab:
sudo apt update -yq
sleep 10
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -yq
sudo apt install wget curl git python openssh-server ca-certificates -yq
sleep 10
#fix for python3 symlink
#ln -s /usr/bin/python3.5 /usr/bin/python
#
echo "postfix postfix/mailname string example.com" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | sudo debconf-set-selections
sudo apt-get install -y postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
IP=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`
echo $IP
sudo EXTERNAL_URL="http://"$IP apt-get install gitlab-ce
echo "Gitlab Installed"
