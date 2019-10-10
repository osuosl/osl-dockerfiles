#!/bin/bash -eux

# Use OSL for repos
sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/CentOS-Base.repo
if [ -f /etc/yum.repos.d/CentOS-AppStream.repo ] ; then
  sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/CentOS-AppStream.repo
  sed -i -e 's/^#baseurl=.*$contentdir\/$releasever\/AppStream\/$basearch\/os\//baseurl=https:\/\/centos.osuosl.org\/$releasever\/AppStream\/$basearch\/os\//g' /etc/yum.repos.d/CentOS-AppStream.repo
fi
if [ "$(uname -m)" == "x86_64" -o -f /etc/yum.repos.d/CentOS-AppStream.repo ] ; then
  sed -i -e 's/^#baseurl=.*$releasever\/os\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/os\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/updates\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/updates\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/addons\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/addons\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/extras\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/extras\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/centosplus\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/centosplus\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/contrib\/$basearch\//baseurl=https\:\/\/centos.osuosl.org\/$releasever\/contrib\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$contentdir\/$releasever\/BaseOS\/$basearch\/os\//baseurl=https:\/\/centos.osuosl.org\/$releasever\/BaseOS\/$basearch\/os\//g' /etc/yum.repos.d/CentOS-Base.repo
else
  sed -i -e 's/^#baseurl=.*$releasever\/os\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/os\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/updates\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/updates\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/addons\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/addons\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/extras\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/extras\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/centosplus\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/centosplus\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$releasever\/contrib\/$basearch\//baseurl=https\:\/\/centos-altarch.osuosl.org\/$releasever\/contrib\/$basearch\//g' /etc/yum.repos.d/CentOS-Base.repo
  sed -i -e 's/^#baseurl=.*$contentdir\/$releasever\/BaseOS\/$basearch\/os\//baseurl=https:\/\/centos-altarch.osuosl.org\/$releasever\/BaseOS\/$basearch\/os\//g' /etc/yum.repos.d/CentOS-Base.repo
fi
