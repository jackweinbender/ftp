#!/bin/bash

echo "Initializing Database..."
RAILS_ENV=test bundle exec rake db:drop db:create db:migrate

echo "Loading Fixtures..."
RAILS_ENV=test bundle exec rake db:fixtures:load FIXTURES_PATH=spec/fixtures