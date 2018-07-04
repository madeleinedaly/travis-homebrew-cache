#!/usr/bin/env bash

echo 'Fetching cache...'
curl -O https://s3.amazonaws.com/baphomet/travis-cache/homebrew-cache.tar.gz

if [ -f homebrew-cache.tar.gz ]; then
  if ! tar tf homebrew-cache.tar.gz &>/dev/null; then
    rm -v homebrew-cache.tar.gz
    echo 'Cache was bad or empty'
    exit 0
  fi

  echo 'Extracting dependencies...'
  tar xzf homebrew-cache.tar.gz -C /usr/local/Cellar

  echo 'Linking dependencies...'
  brew link emacs gnu-sed gnutls texinfo
fi
