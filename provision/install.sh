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
fi

## gem breaker
gem install bundler
cd /vagrant || return
bundle install --path vendor/bundle
