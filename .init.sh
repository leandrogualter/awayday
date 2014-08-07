#!/bin/bash

set -e

BUNDLE_PATH=/tmp/.bundle-$(basename $(pwd))
export BUNDLE_JOBS="${BUNDLE_JOBS:=4}"
if [ ! -z "$SNAP_CI" ]
then
  BUNDLE_PATH=$HOME/.bundle
fi

mkdir -p $BUNDLE_PATH
rm -rf vendor/bundle
mkdir vendor
ln -sf $BUNDLE_PATH vendor/bundle

bundle install --path vendor/bundle --binstubs --clean
