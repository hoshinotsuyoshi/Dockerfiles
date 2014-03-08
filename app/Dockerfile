FROM hoshinotsuyoshi/base

#redis-server ready
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf
RUN sysctl vm.overcommit_memory=1
RUN mkdir /etc/redis && mkdir /usr/local/redis
RUN cp /usr/local/src/redis-2.6.14/utils/redis_init_script /etc/init.d/redis
RUN cp -f /usr/local/src/redis-2.6.14/redis.conf /etc/redis.conf
ADD redis/6379.conf /etc/redis/

#app ready
RUN git clone https://github.com/hoshinotsuyoshi/actresses-sinatra-resque-web app && cd app && bundle --path=vendor/bundle
ADD start.sh /start.sh
RUN chmod +x /start.sh

#supervisor
RUN rm -f /etc/supervisord.conf
ADD supervisord.conf /etc/supervisord.conf

#httpd ready
ADD httpd/httpd.conf  /etc/httpd/conf/httpd.conf

EXPOSE 9292 80
CMD ["/usr/bin/supervisord"]
