#!/usr/bin/env bash

set -oue pipefail

rpm-ostree remove -y 'dnf-command(config-manager)'
