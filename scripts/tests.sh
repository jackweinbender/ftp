#!/bin/bash

echo "Starting Rspec..."
RAILS_ENV=test xvfb-run bundle exec rspec $*