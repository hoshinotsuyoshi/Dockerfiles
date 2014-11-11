FROM ubuntu:latest
RUN apt-get -y update && \
    apt-get -y install git build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev curl && \
    git clone https://github.com/sstephenson/ruby-build && \
    cd ruby-build && \
    ./bin/ruby-build 2.2.0-preview1 /opt/rubies/ruby-2.2.0-preview1
ENV PATH /opt/rubies/ruby-2.2.0-preview1/bin:$PATH
RUN gem install bundler
