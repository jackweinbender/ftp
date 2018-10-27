#!/bin/bash

RAILS_ENV=test bundle exec rake db:drop db:create db:migrate
RAILS_ENV=test bundle exec rake db:fixtures:load FIXTURES_PATH=spec/fixtures
RAILS_ENV=test xvfb-run bundle exec rspec