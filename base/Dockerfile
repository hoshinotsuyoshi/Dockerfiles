FROM centos
RUN yum -y install mysql-server
RUN yum -y install httpd
RUN yum -y install git
RUN yum -y install readline-devel openssl-devel
RUN yum -y install gcc
RUN yum -y install gdbm-devel tcl-devel db4-devel

# zlib for ruby
RUN cd /usr/local/src && wget http://zlib.net/zlib-1.2.8.tar.gz && tar xvzf zlib-1.2.8.tar.gz && cd zlib-1.2.8 && ./configure --prefix=/usr/local && make && make install

# laml for ruby
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

#redis-server start
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
RUN sysctl vm.overcommit_memory=1
RUN mkdir /etc/redis && mkdir /usr/local/redis
RUN cp /usr/local/src/redis-2.6.14/utils/redis_init_script /etc/init.d/redis
RUN cp -f /usr/local/src/redis-2.6.14/redis.conf /etc/redis.conf
ADD redis/6379.conf /etc/redis/

#app start
RUN gem install bundler 

#app start
RUN git clone https://github.com/hoshinotsuyoshi/actresses-sinatra-resque-web app && cd app && bundle --path=vendor/bundle
ADD start.sh /start.sh
RUN chmod +x /start.sh
ENV AZURE_ACCOUNT_KEY $AZURE_ACCOUNT_KEY
ENV ACTRESS_APP_DOMAIN $ACTRESS_APP_DOMAIN
ENV ACTRESS_APP_PASSWORD $ACTRESS_APP_PASSWORD

#supervisor
RUN rm -f /etc/supervisord.conf
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 9292
CMD ["/usr/bin/supervisord"]

