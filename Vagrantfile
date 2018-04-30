# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "../fromthepage", "/fromthepage"
  config.vm.synced_folder "../vagrant_share", "/vagrant_share"

  # Install Ruby 2.2.10
  config.vm.provision "shell", inline: <<-SHELL
    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update
    apt-get upgrade -y
    apt-get install -y git ruby2.2 ruby2.2-dev
  SHELL
  
  # Install MYSQL
  config.vm.provision "shell", inline: <<-SHELL
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    apt-add-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'
    apt-get update

    sudo debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password password root'
    sudo debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password_again password root'
    
    apt-get install software-properties-common
    apt-get install -y mariadb-server

    # sudo mysql -u root -p root -e "UPDATE mysql.user SET plugin='' WHERE User='root';"
    # sudo mysql -u root -p root -e "FLUSH PRIVILEGES;"
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
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    chsh -s `which zsh` vagrant
  SHELL

end