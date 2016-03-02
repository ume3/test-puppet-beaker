#!/bin/bash

## refs: https://github.com/puppetlabs/beaker/blob/master/docs/Beaker-Installation.md
## Beaker only settings
if [ ! "$(rpm -q make)" ]; then
  yum install -d 1 -e 0 -y make gcc gcc-c++ libxml1-devel libxslt-devel ruby-devel
fi

## epel
if ! rpm -qa | grep -q "^epel-release-[0-9]" ; then
  yum -d 1 -e 0 -y update ca-certificates
  yum -d 1 -e 0 -y install epel-release
  yum -d 1 -e 0 -y install git
fi

# rbenv
RUBY_VERSION=2.1.7
if ! [ -d ~vagrant/.rbenv ] ; then
  yum install  -d 1 -e 0 -y openssl-devel readline-devel zlib-devel
  su - vagrant -c "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv"
  su - vagrant -c "echo 'export PATH="~vagrant/.rbenv/bin:~vagrant/.rbenv/shims:/usr/local/bin:${PATH}"' >> ~/.bash_profile"
  su - vagrant -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
  su - vagrant -c "rbenv rehash"

  echo "Installing Ruby ${RUBY_VERSION}"
  su - vagrant -c "rbenv install ${RUBY_VERSION}"
  su - vagrant -c "rbenv rehash"
  su - vagrant -c "rbenv global ${RUBY_VERSION}"
  su - vagrant -c "rbenv exec gem update --system"
  su - vagrant -c "rbenv exec gem install --no-document bundler"
  su - vagrant -c "rbenv rehash"

  cd /vagrant || return
  rbenv exec bundle install --path vendor/bundle
fi
