docker-ubuntu-jdk7
==================
Docker container with Jenkins service based on [sath89/jdk7](https://registry.hub.docker.com/u/sath89/ubuntu_jdk7/)

Usage:

    docker run -v /data/jenkins:/opt/jenkins/jenkins_home --rm --name jenkins --hostname="jenkins.domain.com" --dns=172.17.42.1 --dns-search=domain.com -p 8080:8080 -p 50000:50000 --privileged=true sath89/jenkins
