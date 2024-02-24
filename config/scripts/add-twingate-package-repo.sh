#!/usr/bin/env bash

set -oue pipefail

echo "[packages.twingate.com_rpm_]
name=created by dnf config-manager from https://packages.twingate.com/rpm/
baseurl=https://packages.twingate.com/rpm/
enabled=1
gpgcheck=0" > /etc/yum.repos.d/packages.twingate.com_rpm_.repo
