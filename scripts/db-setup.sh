#!/bin/bash

echo "Initializing Database..."
bundle exec rake db:drop
bundle exec rake db:create

echo "importing DB Dump..."
bundle exec rails db < ../share/init.sql
echo "Complete."

bundle exec rake db:migrate
echo "Migrations Complete."

echo 'User.all().each { |u| u.password = "password"; u.save(); }' | bundle exec rails c
echo "All passwords reset to 'password'"