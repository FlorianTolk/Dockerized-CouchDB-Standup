#!/bin/bash

# Simple script to install Docker
function announce() {
	echo ""
	echo "#====================================================#"
	echo "#"
	echo "#            Installing $1"
	echo "#"
	echo "#====================================================#"
}

# Check for sudo
#
if [ "$EUID" -ne 0 ]
  then announce "Please run as root!"
  exit
fi

# Curl
#
announce "Curl"

if ! [ -x "$(command -v curl)" ]; then
	
	# Curl is easy
	apt-get install curl
	
else
	echo "Skipping, Curl already installed!"
fi


# Docker
#
announce "Docker"

if ! [ -x "$(command -v docker)" ]; then
	
	# Docker is a bit complicated
	#
	# Add the GPG Key
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
	# Add the Docker repository to our APT sources
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	
	# With those added, update our packages
	apt-get update

	# Since we're up to date, get docker
	apt-get install -y docker-ce
else
	echo "Skipping, docker already installed!"
fi

echo "Docker should all be ready."
echo ""

while true; do
    read -p "Do you wish to intialize couchDB? <Y/N>" yn
    case $yn in
        [Yy]* ) bash ./startDocker.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer using y or n.";;
    esac
done
