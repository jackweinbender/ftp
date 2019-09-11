#!/bin/bash
sh -c 'echo "" > log/test.log'
echo "Starting Rspec..."
RAILS_ENV=test xvfb-run bundle exec rspec $*