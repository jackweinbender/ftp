# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "../fromthepage", "/fromthepage"
  config.vm.synced_folder "../vagrant_share", "/share"

  # Install Ruby 2.2.10
  config.vm.provision "shell", inline: <<-SHELL
    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update
    apt-get upgrade -y
    apt-get install -y git software-properties-common
    apt-get install -y ruby2.2 ruby2.2-dev
  SHELL
  
  # Install MYSQL
  config.vm.provision "shell", inline: <<-SHELL
    # Variables for headless install
    # debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password root'
    # debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password root'
    
    apt-get install -y mariadb-server
    # Fix so we don't need sudo
    # mysql < /share/mariadb_sudo-fix.sql
  SHELL

  # Install fromthepage Deps
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
    apt-get install -y pkg-config libmysqlclient-dev
    apt-get install -y imagemagick libmagickwand-dev graphviz ruby-rmagick 
  SHELL
  
  # Install Gem and Bundler Stuff For Fromthepage
  config.vm.provision "shell", inline: <<-SHELL
    gem install bundler --no-rdoc --no-ri
    gem install nokogiri -v '1.8.2'
    gem install ffi -v '1.9.23'
    gem install rmagick -v '2.16.0'
    gem install capybara-webkit -v '1.15.0'
  SHELL
  
  # Setup ZSH
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y zsh
    chsh -s `which zsh` vagrant
  SHELL

  # Install GUI
  # Setup commandline

end