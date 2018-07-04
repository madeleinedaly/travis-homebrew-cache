#!/usr/bin/env bash

echo "Checking if extglob is set..."
getopt extglob

HOMEBREW_EMACS_INSTALLED="$(brew ls | grep -c emacs)"

if ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  echo 'Rebuilding Emacs...'
  brew update
  brew install emacs --with-cocoa --with-gnutls
fi
