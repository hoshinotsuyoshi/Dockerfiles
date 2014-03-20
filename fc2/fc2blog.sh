#!/bin/bash

sleep 15 #hidoi
cd /fastladder && bundle exec rake db:create db:migrate
cd /fastladder && bundle exec rake setup
cd /fastladder && bundle exec rake assets:precompile
cd /fastladder && bundle exec rackup -p 3000
