# rbenv install for 2.3.7 on arch

# Install openssl 1.0
sudo pacman -S openssl-1.0

# Install 2.3.7 with specified version of openssl
PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig rbenv install 2.3.7