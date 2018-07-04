#!/usr/bin/env bash

tar czf homebrew-cache.tar.gz -C /usr/local/Cellar emacs gnutls

mkdir -p s3-cache
mv homebrew-cache.tar.gz s3-cache
