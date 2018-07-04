#!/usr/bin/env bash

if ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  brew update
  brew install emacs --with-cocoa --with-gnutls
fi
