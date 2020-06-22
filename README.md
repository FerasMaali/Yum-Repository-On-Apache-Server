# Internship-Task3
In this task I was supposed to create a yum package repository on an Apache server and test it using a CentOS container

## How I solved it?
* Have an Apache server on a CentOS docker container that provides the repository's packages
* Packages served by the server are the ones available in `server/packages` (a docker volume)
* Create another CentOS docker container that works as a client
* The client doesn't have any repository other than `my_repo` (I can use yum priority as an alternative)
* To populate the container with packages, use `create_repo` script or do it manually

## How to use the code?
1. Clone this repository using 
```
	git clone git@github.com:FerasMaali/Internship-Task3.git
```
2. Populate the repo with packages using 
```
	./create_repo
```
3. Start the server
```
    cd server
    ./restart_server
```
4. Start the client
```
    cd ../client
    ./start_client
```

### Note
You may need to modify the server ip address in `server/my_repo.repo`. The following command may help you to find the ip address
```
    ip a | grep 'inet ' | grep docker | awk '{ print $2 }' | python3 -c 'print(input().split("/")[0])'
```
