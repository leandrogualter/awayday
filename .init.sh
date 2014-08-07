#!/bin/bash

set -e

export BUNDLE_JOBS="${BUNDLE_JOBS:=4}"
if [ -z "$SNAP_CI" ]; then
  BUNDLE_PATH=/tmp/.bundle-$(basename $(pwd))
else
  BUNDLE_PATH=$HOME/.bundle;
fi

mkdir -p $BUNDLE_PATH
rm -rf vendor/bundle
ln -sf $BUNDLE_PATH vendor/bundle

bundle install --path vendor/bundle --binstubs --clean
