docker run -d --name ubuntu-jenkins --privileged -p 8080:8080 -v /var/log/.jenkins:/root/.jenkins:rw hoshinotsuyoshi/jenkins-docker
