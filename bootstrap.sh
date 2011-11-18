#!/usr/bin/env bash

echo "Installing GCC"
gcc="GCC-10.7-v2.pkg"
curl -L https://github.com/downloads/kennethreitz/osx-gcc-installer/$gcc -o /tmp/$gcc
/usr/sbin/installer -pkg /tmp/$gcc -target /

echo "Installing Chef"
gem install rdoc chef ohai --no-ri --no-rdoc --source http://gems.opscode.com --source http://gems.rubyforge.org
mkdir -p /tmp/chef
curl -L https://raw.github.com/highgroove/bootstrap/solo.rb -o /tmp/chef/solo.rb
