#!/bin/bash

echo "Resetting Database..."
bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
echo "Migrations Complete."

echo "Unzipping Dump File..."
gunzip -kf ~/share/*dmp.gz
echo "importing DB Dump..."
mysql -uroot diary_development < ~/share/*.dmp
echo "Complete."