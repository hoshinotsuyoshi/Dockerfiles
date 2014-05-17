docker run -d --name jenkins-docker --privileged -p 8080:8080 -v /var/log/.jenkins:/root/.jenkins:rw hoshinotsuyoshi/jenkins-docker
