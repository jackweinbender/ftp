# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :forwarded_port, guest: 3000, host: 1234

  # Install Ruby 2.2.10
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y git ruby2.2 ruby2.2-dev
    ruby -v
  SHELL
  
  # Install MYSQL
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'
    sudo apt-get update

    sudo debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password password root'
    sudo debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password_again password root'
    
    sudo apt-get install software-properties-common
    sudo apt-get install -y mariadb-server
  SHELL

  # Install fromthepage Deps
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
    sudo apt-get install -y pkg-config libmysqlclient-dev
    sudo apt-get install -y imagemagick libmagickwand-dev graphviz ruby-rmagick 
  SHELL
  
  # Install Gem and Bundler Stuff For Fromthepage
  config.vm.provision "shell", inline: <<-SHELL
    sudo gem install bundler --no-rdoc --no-ri
    sudo gem install nokogiri -v '1.8.2'
    sudo gem install ffi -v '1.9.23'
    sudo gem install rmagick -v '2.16.0'
    sudo gem install capybara-webkit -v '1.15.0'
  SHELL
  
end