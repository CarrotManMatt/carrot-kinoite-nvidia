#!/usr/bin/env bash

set -euo pipefail

# This script comes from fiftydinar's Gidro-OS (https://github.com/fiftydinar/gidro-os/blob/main/config/scripts/bootc-update-bootloader.sh)

# Update bootloader metadata inside the image, which will be utilized further by bootc in ISO to update the bootloader on system
bootupctl backend generate-update-metadata
