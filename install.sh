#!/usr/bin/env bash

HOMEBREW_EMACS_INSTALLED="$(brew ls | grep -c emacs)"
INSTALL_DIR=$(find /usr/local/Cellar/emacs -type d -name 'HEAD-*')

LAST_COMMIT_BUILT=$(echo ${INSTALL_DIR:29:7})
CURRENT_HEAD_LONG=$(git ls-remote https://github.com/emacs-mirror/emacs.git HEAD | awk '{print $1}')
CURRENT_HEAD_SHORT=${CURRENT_HEAD_LONG:0:7}

echo 'Last commit built:' $LAST_COMMIT_BUILT
echo 'Current upstream HEAD:' $CURRENT_HEAD_SHORT

if [[ $CURRENT_HEAD_SHORT != $LAST_COMMIT_BUILT ]] || ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  echo 'Rebuilding Emacs...'
  brew uninstall emacs
  brew update
  brew install emacs --HEAD --with-cocoa
fi
