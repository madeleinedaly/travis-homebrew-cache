#!/usr/bin/env bash

tar czf homebrew-cache.tar.gz -C /usr/local/Cellar emacs gnutls

mkdir -pv s3-cache
mv -v homebrew-cache.tar.gz s3-cache
