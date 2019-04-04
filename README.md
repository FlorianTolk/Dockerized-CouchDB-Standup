# # Dockerized-CouchDB-Standup
A small repository that explains how to build and deploy a dockerized version of couchDB using Apache's official Dockerhub image

### OS and Hardware
This repository was built on Ubuntu 18.04.2 LTS 64 Bit
CPU: Intel® Core™ i7-7700HQ CPU @ 2.80GHz
Memory: 8.1 GiB
Disk: 500 GB
###### _Internet Connection Required!_ #
#
#
### Installation Instructions
#### Install Docker
**Option A**: 
Use the install shell file:
```
sudo bash ./install.sh
```
**Option B**: 
Install it manually
 - _Install Docker_
```
sudo apt install curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce
```

#### Get the CouchDB Docker Image and Start it
**Option A**: 
When prompted by the install shell file to intialize couchDB just input `y`

**Option B**: 
run the startup shell file
```
sudo bash ./startDocker.sh
```

**Option C**:
manually stand up the couchDB instance 
```
sudo docker pull couchdb
sudo docker run --name some-repo -p 5984:5984 -v /home/couchdb/data:/opt/couchdb/data -d couchdb
```

#### Initialize CouchDB
In your browser navigate to `http://<server_ip>:5984/_utils#setup`
Configure a cluster
Ensure everything is set up to point to the correct IPs

For a guide on proper setup, see <https://docs.couchdb.org/en/stable/setup/index.html>
 - **Note**: The default variables will be good if this is for local use

