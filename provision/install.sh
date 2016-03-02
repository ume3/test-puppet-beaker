#!/bin/bash

## refs: https://github.com/puppetlabs/beaker/blob/master/docs/Beaker-Installation.md
## Beaker only settings
if [ ! "$(rpm -q make)" ]; then
  yum install -d 1 -e 0 -y make gcc gcc-c++ libxml1-devel libxslt-devel ruby-devel
fi
