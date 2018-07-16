#!/bin/bash

echo "Initializing Database..."
bundle exec rake db:drop
bundle exec rake db:create

echo "Unzipping Dump File..."
gunzip -kf ~/share/*dmp.gz
echo "importing DB Dump..."
mysql -uroot diary_development < ~/share/*.dmp
echo "Complete."

bundle exec rake db:migrate
echo "Migrations Complete."