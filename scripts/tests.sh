#!/bin/bash

RAILS_ENV=test rake db:drop db:create db:migrate
RAILS_ENV=test rake db:fixtures:load FIXTURES_PATH=spec/fixtures
xvfb-run rspec spec/features