#!/bin/bash

i
        #Description: This script is to install Jenkins on a Centos Server.our command.
	
	#Author : Elise Pedie
        #Date: March 3,2022
        #About Jenkins:Jenkins is an open-source, Java-based automation server "that offers an easy way to set up a continuous integration and continuous delivery (CI/CD) pipeline. To read more about jenkins, visit https://jenkins.io                                                                    dhat/jenkins.repo      

  #Please, verify your command and permission before proceeding.

echo "Installing Jenkins on a CentOS 7 systems."
if
[ $USER != root ]
then
echo "You must be an administrator to run this script. Please contact your 
administrator for appropriate permissions."
exit 2
else
echo "Welcome sysAdmin. Please proceed with installation."
fi
sleep 5
echo
echo "Since Jenkins is a Java application, we first need to install Java on "
echo
sleep 5
sudo yum install java-1.8.0-openjdk-devel
if
[ $? -ne 0 ]
then
echo "There seems to be an issue with either your java application or your 
command. Please verify your command before proceeding."
exit 3
fi
echo " Enabling the Jenkins Repository..."
echo
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
if
[ $? -ne 0 ]
then
sudo yum install wget -y
else
echo "Now disabling key check on the repository. Please wait..."
fi
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo      
if
[ $? -ne 0 ]
then
echo"Please verify command.Key check is still enabled on the repo."        
exit 7
fi
sleep 5
echo "Installing the latest stable version of Jenkins. Please wait..."     
sleep 5
echo
sudo yum install jenkins
if
[ $? -ne 0 ]
then
echo "There seems to be an issue with your command. Please try again."     
exit 8
fi
sleep 5
echo "Jenkins successfully installed. Now starting and enabling the jenkins service..."
sleep 5
echo
sudo systemctl status jenkins
sleep 5
sudo systemctl enable jenkins
sleep 4
sudo systemctl start jenkins
echo
echo "Adjusting the firewall requirements to ensure the necessary ports are opened..."
sleep 3
echo
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sleep 2
if
[ $? -ne 0 ]
then
echo "Please verify that necessary ports are not in use."
exit 9
fi
sudo firewall-cmd --reload
echo
sleep 5
echo "What is my ip address?"
sudo yum install net-tools -y
sleep 5
echo
echo "Your ip address is ..."
sleep 4
ifconfig | grep 192.
echo
sleep 3
echo "Your jenkins repository is now successfully installed. Launch your google browser and type your IP address(192.x.x.x) followed by the port number i.e 8080 to access it."
echo
echo "Example:http://your_ip_or_domain:8080 "
echo
echo "Please copy the below password to unlock Jenkins."
sleep 3
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
if
[ $? -ne 0 ]
then
echo "Contact your admininstrator for Jenkins repository PW."
exit 10
fi

sleep 1
echo
echo
echo "Thank you.Please contact your system admin for additional questions"
