#!/bin/bash -eux

# Use OSL for repos
sed -i -e 's/^\(metalink.*\)/#\1/g' /etc/yum.repos.d/epel.repo
sed -i -e 's/^\(#baseurl=http\(s\)\?:\/\/download.fedoraproject.org\/pub\/epel\)\(.*\)/baseurl=https:\/\/epel.osuosl.org\3/g' /etc/yum.repos.d/epel.repo
