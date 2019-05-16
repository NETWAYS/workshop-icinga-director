#!/bin/bash

set -e

if ! rpm -q puppet-release &>/dev/null; then
  yum install -y https://yum.puppetlabs.com/puppet6-release-el-7.noarch.rpm
fi

if ! rpm -q epel-release &>/dev/null; then
  #yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  yum install -y epel-release
fi

if ! rpm -q centos-release-scl-rh &>/dev/null; then
  yum install -y centos-release-scl-rh
fi

if ! rpm -q puppet-agent &>/dev/null; then
  yum install -y puppet-agent
fi
