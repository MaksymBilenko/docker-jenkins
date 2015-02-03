FROM sath89/ubuntu_jdk7

MAINTAINER Maksym Bilenko "sath891@gmail.com"

RUN apt-get update -q && apt-get install git curl wget mysql-client -y -q
ENV JENKINS_PREFIX /
ENV JENKINS_HOME /opt/jenkins/jenkins_home
ENV JAVA_ARGS -Xmx2048m -XX:MaxPermSize=512m
RUN mkdir -p /opt/jenkins

RUN groupadd -g 505 jenkins
RUN useradd -m -u 505 -g 505 -d $JENKINS_HOME jenkins

RUN chown -R jenkins:jenkins $JENKINS_HOME && chown -R jenkins:jenkins /opt/jenkins
RUN wget -q -O /opt/jenkins/jenkins.war http://mirrors.jenkins-ci.org/war/latest/jenkins.war
USER jenkins
CMD exec java -jar $JENKINS_HOME/../jenkins.war $JAVA_ARGS --prefix=$JENKINS_PREFIX

EXPOSE 50000/tcp
EXPOSE 8080/tcp
