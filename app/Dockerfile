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
ADD sinatra.sh /sinatra.sh
RUN chmod +x /sinatra.sh

#fastladder ready
RUN yum -y install libxml2-dev libxslt rubygem-nokogiri
RUN yum -y install curl-devel
RUN yum -y install mysql-devel sqlite3 sqlite-devel
RUN yum -y install libxml2 libxml2-devel libxslt libxslt-devel
RUN git clone https://github.com/fastladder/fastladder fastladder && cd fastladder && echo "gem 'therubyracer', platforms: :ruby" >> Gemfile && NOKOGIRI_USE_SYSTEM_LIBRARIES=1 bundle --path=vendor/bundle
RUN cd /fastladder && mv config/database.yml.mysql config/database.yml
RUN cd /fastladder && sed -i 's/\/var\/run\/mysqld\/mysqld\.sock/\/var\/lib\/mysql\/mysql\.sock/g' config/database.yml

#mysql ready
RUN echo "NETWORKING=yes" >/etc/sysconfig/network

#fastladder ready
#RUN cd /fastladder && bundle exec rake setup #&& bundle exec rake db:migrate && bundle exec rake db:setup #secret.rb and migration and setup
ADD fastladder.sh /fastladder.sh
RUN chmod +x /fastladder.sh
ADD fastladder_crawler.sh /fastladder_crawler.sh
RUN chmod +x /fastladder_crawler.sh

#supervisor
RUN rm -f /etc/supervisord.conf
ADD supervisord.conf /etc/supervisord.conf

#httpd ready
ADD httpd/httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 9292 80 3000
CMD ["/usr/bin/supervisord"]
