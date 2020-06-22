# Internship-Task3
In this task I was supposed to create a yum package repository on an Apache server and test it using a CentOS container

## How I solved it?
* Have an Apache server on a CentOS docker container that works as a repository
* Packages served by the server are the ones available in `server/packages` (a docker volume)
* Create another CentOS docker container that works as a client
* To populate the container with packages, use `create_repo` script

## How to use the code?
1. 
