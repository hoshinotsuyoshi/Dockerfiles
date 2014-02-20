FROM centos
RUN yum -y install mysql-server
RUN yum -y install httpd
RUN yum -y install git
RUN yum -y install readline-devel openssl-devel
RUN yum -y install gcc
RUN yum -y install gdbm-devel tcl-devel db4-devel

RUN cd /usr/local/src && wget http://zlib.net/zlib-1.2.8.tar.gz && tar xvzf zlib-1.2.8.tar.gz && cd zlib-1.2.8 && ./configure --prefix=/usr/local && make && make install

RUN cd /usr/local/src/ && wget http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz && tar zxvf yaml-0.1.5.tar.gz && cd yaml-0.1.5 && ./configure --prefix=/usr/local && make && make install

RUN cd /usr/local/src && wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz && tar xvzf ruby-2.1.0.tar.gz && cd ruby-2.1.0 && ./configure --prefix=/usr/local && make && make install

RUN cd /usr/local/src && wget http://redis.googlecode.com/files/redis-2.6.14.tar.gz && tar xvzf redis-2.6.14.tar.gz && cd redis-2.6.14 && make && make install

EXPOSE 6379
CMD ["/usr/local/bin/redis-server"]
