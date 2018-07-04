#!/usr/bin/env bash

echo 'Creating cache...'
tar czf homebrew-cache.tar.gz -C /usr/local/Cellar emacs gnu-sed gnutls texinfo

mkdir -pv s3-cache
mv -v homebrew-cache.tar.gz s3-cache
