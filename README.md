# Yum-Repository-On-Apache-Server
In this task:
1. At first, I was supposed to create a yum repository and make it available on the network using Apache server and test it using a CentOS container
2. After that, I was expected to create a Jenkins Pipeline to automate the full CD pipeline

## How I solved it?
* Have an Apache server on a CentOS docker container that provides the repository's packages
* Create another CentOS docker container that works as a client
* The client doesn't have any repository other than `my_repo` (I can use yum priority as an alternative)
* Setup a Nexus repository manager to be used as a docker registry (See NXRM [ repository ]( https://hub.docker.com/r/sonatype/nexus3/ ) on docker hub
* Deploy the server's docker image to [ docker hub ]( https://hub.docker.com/r/sonatype/nexus3/ ) & local NXRM
* Created a Jenkins Pipeline (See [ Jenkinsfile ]( https://github.com/FerasMaali/Yum-Repository-On-Apache-Server/blob/master/Jenkinsfile )) to automate the process

## How to use the code?
### First Method (recommended)
1. Fork this repository
2. Setup your local registry using NXRM
3. Setup a Jenkins server to use your new repository (the Github one), and its Jenkins Pipeline automatically

### Second Method
1. Clone this repository using 
```
git clone https://github.com/FerasMaali/Yum-Repository-On-Apache-Server.git
cd Yum-Repository-On-Apache-Server
```

2. Start the server
```
cd server
./start_server
```

3. Create the client
```
cd ../client
./create_client
```

4. Test the client
```
./test_client
```

### Note
1. You may need to modify the server ip address in `server/my_repo.repo`. The following command may help you to find the ip address
```
ip a | grep 'inet ' | grep docker | awk '{ print $2 }' | python3 -c 'print(input().split("/")[0])'
```

2. On some systems you may need to modify the firewall settings so that it doesn't prevent the client's connection to the server. See: https://stackoverflow.com/questions/40214617/docker-no-route-to-host

