#!/usr/bin/env bash

set -euo pipefail

curl -o /tmp/pam_pwdfile-1.0-3.3.x86_64.rpm "ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home%3A/Akoellh/openSUSE_Leap_42.3_Update/x86_64/pam_pwdfile-1.0-3.3.x86_64.rpm"
rpm-ostree install /tmp/pam_pwdfile-1.0-3.3.x86_64.rpm
