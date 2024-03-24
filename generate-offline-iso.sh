#!/usr/bin/env bash

# Thanks to Universal Blue for providing the repo for generating offline ISOs
# https://github.com/ublue-os/isogenerator

# Thanks to fiftydinar for providing the template this script is based off of
# https://github.com/fiftydinar/gidro-os/blob/main/gidro-os-build-offline-iso.sh


IMAGE_REPO=ghcr.io/carrotmanmatt
IMAGE_NAME=carrot-kinoite-nvidia
IMAGE_TAG=latest
IMAGE_VARIANT=Kinoite
ARCH=x86_64
INSTALLER_VERSION=39
WEB_UI=false

sudo docker run --rm --privileged --volume .:/isogenerator/output \
-e ARCH="$ARCH" -e VERSION="$INSTALLER_VERSION" -e IMAGE_REPO="$IMAGE_REPO" -e IMAGE_NAME="$IMAGE_NAME" -e IMAGE_TAG="$IMAGE_TAG" -e VARIANT="$IMAGE_VARIANT" -e WEB_UI="$WEB_UI" \
ghcr.io/ublue-os/isogenerator:$INSTALLER_VERSION
