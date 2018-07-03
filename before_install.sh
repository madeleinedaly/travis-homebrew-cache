#!/usr/bin/env bash

curl -O https://s3.amazonaws.com/baphomet/travis-cache/homebrew-cache.tar.gz

if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz; then
    rm homebrew-cache.tar.gz
    exit 0
  fi

  tar xzf homebrew-cache.tar.gz -C /usr/local/Cellar
  brew link emacs gnutls
fi
