#!/bin/sh

curl -O https://s3.amazon.com/baphomet/travis-cache/homebrew-cache.tar.gz
if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz &>/dev/null; then
    rm homebrew-cache.tar.gz
    exit 0
  fi

  tar zxf homebrew-cache.tar.gz --directory /usr/local/Cellar
  brew link node openssl pkg-config
fi
