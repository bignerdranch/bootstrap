#!/usr/bin/env bash

echo "prepare /usr/local"
sudo mkdir /usr/local
sudo chown $USER:staff /usr/local

echo "install gcc"
gcc="GCC-10.7-v2.pkg"
curl -L https://github.com/downloads/kennethreitz/osx-gcc-installer/$gcc -o /tmp/$gcc
sudo /usr/sbin/installer -pkg /tmp/$gcc -target /

echo "install chef"
sudo gem install rdoc chef ohai --no-ri --no-rdoc

echo "download configuration and cookbooks"
curl -L https://github.com/highgroove/bootstrap/tarball/master -o /tmp/chef.tar.gz
mkdir -p /tmp/chef
tar xvfz /tmp/chef.tar.gz -C /tmp/chef --strip-components 1

echo "run chef-solo"
chef-solo -c /tmp/chef/solo.rb

echo "remove chef"
rm -rf /tmp/chef