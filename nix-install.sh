#!/bin/bash

## Already installed?
# nix --version 2> /dev/null \
#     && echo "Nix is already INSTALLED!  Exiting" && exit 0

# Install Nix multi-user
# REF:  https://nixos.org/download/#nix-install-linux
sh <(curl -L https://nixos.org/nix/install) --daemon
