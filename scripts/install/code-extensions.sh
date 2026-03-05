#!/bin/sh

install_code_extensions() {
  if ! command -v code; then
    echo "Could not find code binary. Consider installing it with your package manager."
    exit 1
  fi

  while IFS= read -r line; do
    code --install-extension "$line"
  done <"$1"
}

install_code_extensions "$1"
