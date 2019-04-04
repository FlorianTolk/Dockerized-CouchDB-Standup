#!/bin/bash

# Simple script to install Docker
function announce() {
	echo ""
	echo "#==============================================================================#"
	echo "#"
	echo "#            $1"
	echo "#"
	echo "#==============================================================================#"
}

if [ "$EUID" -ne 0 ]
  then announce "Please run as root!"
  exit
fi

announce "Killing all previous docker instances"

bash ./killall.sh

announce "Starting latest couchDB from DockerHub"

docker pull couchdb

docker run --name some-repo -p 5984:5984 -v /home/couchdb/data:/opt/couchdb/data -d couchdb

echo ""
echo "#==============================================================================#"
echo "#"
echo -e "#            Please navigate to \e[4;34mhttp:localhost:5984/_utils#setup\e[0m"
echo "#            in your browser to complete installation."
echo "#"
echo "#==============================================================================#"


