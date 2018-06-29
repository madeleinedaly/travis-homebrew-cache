#!/bin/sh

mkdir travis-cache
if [ ! homebrew-cache.tar.gz ]; then
  tar czf travis-cache/homebrew-cache.tar.gz --directory /usr/local/Cellar node openssl pkg-config
fi
