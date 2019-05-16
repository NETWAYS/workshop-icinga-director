#!/bin/bash

set -e

if ! rpm -q puppet-release &>/dev/null; then
  yum install -y https://yum.puppetlabs.com/puppet6-release-el-7.noarch.rpm
fi

if ! rpm -q epel-release &>/dev/null; then
  yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
fi

if ! rpm -q puppet-agent &>/dev/null; then
  yum install -y puppet-agent
fi
