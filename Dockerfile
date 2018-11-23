FROM ruby:2.3
RUN apt-get update -qq && \
    apt-get install -y \
        qt5-default libqt5webkit5-dev \
        gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
        pkg-config mysql-client \
        ghostscript imagemagick libmagickwand-dev graphviz ruby-rmagick \
        nodejs \
        xvfb
WORKDIR /fromthepage
COPY fromthepage/Gemfile /fromthepage/Gemfile
COPY fromthepage/Gemfile.lock /fromthepage/Gemfile.lock
RUN gem install bundler && bundle install -j 4