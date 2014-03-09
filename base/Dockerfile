FROM centos
RUN yum -y install mysql-server
RUN yum -y install httpd
RUN yum -y install git

# for ruby
RUN yum -y install readline-devel openssl-devel gcc gdbm-devel tcl-devel db4-devel

# zlib for ruby
RUN cd /usr/local/src && wget http://zlib.net/zlib-1.2.8.tar.gz && tar xvzf zlib-1.2.8.tar.gz && cd zlib-1.2.8 && ./configure --prefix=/usr/local && make && make install

# yaml for ruby
RUN cd /usr/local/src/ && wget http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz && tar zxvf yaml-0.1.5.tar.gz && cd yaml-0.1.5 && ./configure --prefix=/usr/local && make && make install

# ruby
RUN cd /usr/local/src && wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz && tar xvzf ruby-2.1.0.tar.gz && cd ruby-2.1.0 && ./configure --prefix=/usr/local && make && make install

# redis
RUN cd /usr/local/src && wget http://redis.googlecode.com/files/redis-2.6.14.tar.gz && tar xvzf redis-2.6.14.tar.gz && cd redis-2.6.14 && make && make install

# Development Tools
RUN yum -y groupinstall "Development Tools"

#supervisor
RUN wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh epel-release-6-8.noarch.rpm
RUN echo "enabled=1" >> /etc/yum.repos.d/epel.repo
RUN yum -y install supervisor

#mongo
ADD 10gen.repo /etc/yum.repos.d/10gen.repo
RUN yum -y install mongo-10gen mongo-10gen-server

#bundler install
RUN gem install bundler

# java
RUN yum -y install java
# jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins
