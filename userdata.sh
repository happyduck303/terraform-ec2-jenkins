#!/bin/bash
sudo apt-get -y update
# Install OpenJDK 8
sudo apt-get -y install openjdk-8-jdk
# Install Jenkins
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y install jenkins
#install docker
sudo apt-get install docker.io -y
#solve error docker
sudo chmod 666 /var/run/docker.sock
sudo su $USER  -c groups
sudo chgrp docker /lib/systemd/system/docker.socket
sudo chmod g+w /lib/systemd/system/docker.socket
sudo chgrp $USER /lib/systemd/system/docker.socket
sudo chmod g+w /lib/systemd/system/docker.socket

#add jenkins to user docker
sudo groupadd docker
sudo usermod -aG docker jenkins
sudo usermod -aG docker ubuntu
cat /etc/group | grep docker
sudo reboot
