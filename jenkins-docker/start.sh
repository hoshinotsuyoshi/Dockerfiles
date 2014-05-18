docker run -d --name dind-jenkins --privileged -p 8080:8080 -v /var/log/.jenkins:/root/.jenkins:rw hoshinotsuyoshi/dind-jenkins
