FROM hoshinotsuyoshi/mongo-ruby

RUN apt-get -y install git-core
RUN gem install bundler
RUN git clone -b vps https://github.com/hoshinotsuyoshi/actresses.git
RUN cd actresses && bundle
RUN cd actresses && ./bin/rake assets:precompile
#ENTRYPOINT cd actresses && ./bin/rails s
ENTRYPOINT /usr/bin/mongod & cd actresses && ./bin/rails s

#EXPOSE 27017
#EXPOSE 80
#CMD cd actresses && ./bin/rails s

#ENTRYPOINT usr/bin/mongod
