#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install -y 'dnf-command(config-manager)'
rpm-ostree config-manager --add-repo https://packages.twingate.com/rpm/
rpm-ostree config-manager --save --setopt=packages.twingate.com_rpm_.gpgcheck=0
