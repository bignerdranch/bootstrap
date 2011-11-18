#!/usr/bin/env bash

echo "install gcc"
gcc="GCC-10.7-v2.pkg"
curl -L https://github.com/downloads/kennethreitz/osx-gcc-installer/$gcc -o /tmp/$gcc
/usr/sbin/installer -pkg /tmp/$gcc -target /

echo "install chef"
gem install rdoc chef ohai --no-ri --no-rdoc --source http://gems.opscode.com --source http://gems.rubyforge.org
mkdir -p /tmp/chef
curl -L https://raw.github.com/highgroove/bootstrap/solo.rb -o /tmp/chef/solo.rb

echo "prepare for homebrew install"
sudo chown -R `whoami`:staff /usr/local

echo "run chef-solo"
chef-solo -c /tmp/chef/solo.rb
