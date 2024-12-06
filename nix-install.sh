#!/bin/bash

# Install Nix multi-user
# REF:  https://nixos.org/download/#nix-install-linux
sh <(curl -L https://nixos.org/nix/install) --daemon

# Set up /etc/nix/nix.conf
sudo mkdir -p /etc/nix
sudo printf "build-users-group = nixbld\nexperimental-features = nix-command flakes\n" | sudo tee /etc/nix/nix.conf
