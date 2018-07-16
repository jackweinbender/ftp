# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  
  config.vm.box = "ubuntu/xenial64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 6096
    v.cpus = 4
  end
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.synced_folder "fromthepage", "/home/vagrant/fromthepage"
  config.vm.synced_folder "share", "/home/vagrant/share"
  config.vm.synced_folder "scripts", "/home/vagrant/scripts"

  # Install Ruby 2.3.X
  config.vm.provision "shell", inline: <<-SHELL
    apt-add-repository ppa:brightbox/ruby-ng
    apt-get update
    apt-get upgrade -y
    apt-get install -y git software-properties-common
    apt-get install -y ruby2.3 ruby2.3-dev
  SHELL
  
  # Install MYSQL
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y mariadb-server
    
    # Fix so we don't need sudo
    mysql -uroot -e "UPDATE mysql.user SET plugin = 'mysql_native_password', Password = PASSWORD('') WHERE User = 'root';"
    mysql -uroot -e "FLUSH PRIVILEGES;"

  SHELL

  # Install fromthepage Deps
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
    apt-get install -y pkg-config libmysqlclient-dev
    apt-get install -y imagemagick libmagickwand-dev graphviz ruby-rmagick
    apt-get install -y xvfb
  SHELL
  
  # Install Gem and Bundler Stuff For Fromthepage
  config.vm.provision "shell", inline: <<-SHELL
    gem update --system --no-doc --no-ri
    gem install bundler --no-rdoc --no-ri
  SHELL
  
  # Setup ZSH
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y zsh
    chsh -s `which zsh` vagrant
    
    # Setup commandline
    git clone https://github.com/jackweinbender/dotfiles.git /home/vagrant/.dotfiles
    git clone https://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh

    ln -s /home/vagrant/.dotfiles/symlinks/.zshrc /home/vagrant/.zshrc 
    ln -s /home/vagrant/.dotfiles/symlinks/jack.zsh-theme /home/vagrant/.oh-my-zsh/themes/jack.zsh-theme
  SHELL
end