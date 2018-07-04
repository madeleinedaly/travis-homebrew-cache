#!/usr/bin/env bash

HOMEBREW_EMACS_INSTALLED="$(brew ls | grep -c emacs)"
INSTALL_DIR=$(find /usr/local/Cellar/emacs -type d -name 'HEAD-*')

LAST_COMMIT_BUILT=$(echo ${INSTALL_DIR:29:7})
CURRENT_UPSTREAM_HEAD=$(git ls-remote git@github.com:emacs-mirror/emacs.git HEAD | awk '{print $1}')

echo 'Last commit built:' $LAST_COMMIT_BUILT
echo 'Current upstream HEAD:' $CURRENT_UPSTREAM_HEAD

if [[ $LAST_COMMIT_BUILT != $CURRENT_UPSTREAM_HEAD ]] || ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  echo 'Rebuilding Emacs...'
  brew uninstall emacs
  brew update
  brew install emacs --HEAD --with-cocoa
fi
