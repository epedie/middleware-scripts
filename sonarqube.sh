i#!/bin/bash

#Author : Elise Group19 Ubuntu 
# 03/03/2022

# Test1 for Sonarqube Ubuntu

> /dev/null 2>&1

echo -e "\n Installing JAVA in the machine\n"
sleep 2
sudo apt-get  update -y

 sudo apt-get  install java-11-openjdk-devel -y
 sudo apt-get  install java-11-openjdk -y

echo -e "\n navigate to opt directory\n"
sleep 2

cd /opt

echo "\n install the Wget package in the machine \n"
sleep 1
sudo apt-get install wget -y

echo -e "\n Installing Sonarqube in the machine\n"
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

echo -e "\n Installing Unzip package and unzipping the Sonarqube package  \n"
sleep 2
sudo apt-get install unzip
sudo unzip /opt/sonarqube-9.3.0.51899.zip

echo -e "\n change Ownwership to the user and Switch to Linux binaries directory to start service \n"

sleep 2

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

 cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64


 sudo systemctl enable sonar.sh
sudo systemctl start sonar.sh


echo -e "\n Connect to the SonarQube server through the browser. It uses port 9000\n"
IP= `hostname -I | awk '{print$2}'`
http://$IP:9000

sudo ufw allow 9000/tcp

echo -e "\n Sonarquebe is install successfully\n"
