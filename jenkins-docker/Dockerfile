FROM jpetazzo/dind

# jenkins
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get -y update
RUN apt-get -y install jenkins

# git, supervisor
RUN apt-get -y install git-core supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080
CMD ["/usr/bin/supervisord"]
