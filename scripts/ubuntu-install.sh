#! /bin/bash

# Install Ruby
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git software-properties-common
sudo apt-get install -y ruby2.3 ruby2.3-dev

# MariaDB
sudo apt-get install -y mariadb-server
    
# Fix so we don't need sudo
mysql -uroot -e "UPDATE mysql.user SET plugin = 'mysql_native_password', Password = PASSWORD('') WHERE User = 'root';"
mysql -uroot -e "FLUSH PRIVILEGES;"

# Fromthepage Deps
sudo apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
sudo apt-get install -y pkg-config libmysqlclient-dev
sudo apt-get install -y imagemagick libmagickwand-dev graphviz ruby-rmagick
sudo apt-get install -y xvfb

# Gem and Bundler Stuff
gem update --system --no-doc --no-ri
gem install bundler --no-rdoc --no-ri

# My shell prefs
sudo apt-get install -y zsh
chsh -s `which zsh` vagrant

# Setup commandline
git clone https://github.com/jackweinbender/dotfiles.git /home/vagrant/.dotfiles
git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh

ln -s /home/vagrant/.dotfiles/symlinks/.zshrc /home/vagrant/.zshrc 
ln -s /home/vagrant/.dotfiles/symlinks/jack.zsh-theme /home/vagrant/.oh-my-zsh/themes/jack.zsh-theme