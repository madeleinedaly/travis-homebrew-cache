#!/usr/bin/env bash

INSTALL_DIR=$(find /usr/local/Cellar/emacs -type d -name 'HEAD-*')

LAST_COMMIT_BUILT=$(cat "$INSTALL_DIR/INSTALL_RECEIPT.json" | python -c "import sys, json; print(json.load(sys.stdin)['HEAD'])")
CURRENT_UPSTREAM_HEAD=$(git ls-remote git://git.sv.gnu.org/emacs.git HEAD | awk '{print $1}')

HOMEBREW_EMACS_INSTALLED="$(brew ls | grep -c emacs)"

echo 'Last commit built:' $LAST_COMMIT_BUILT
echo 'Current upstream HEAD:' $CURRENT_UPSTREAM_HEAD

if [[ $LAST_COMMIT_BUILT != $CURRENT_UPSTREAM_HEAD ]] || ! [[ $HOMEBREW_EMACS_INSTALLED -eq 1 ]]; then
  echo 'Rebuilding Emacs...'
  brew uninstall emacs
  brew update
  brew install emacs --HEAD --with-cocoa
fi
