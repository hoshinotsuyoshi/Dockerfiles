FROM centos:latest

#jenkins-start
# java
RUN yum -y install wget tar java-1.6.0-openjdk
# jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins

EXPOSE 8080
CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]
