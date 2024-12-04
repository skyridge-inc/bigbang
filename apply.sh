#!/bin/bash

# nix run nix-darwin \
#     --extra-experimental-features 'nix-command flakes' \
#     -- switch --flake .

# nix --extra-experimental-features \
#     "nix-command flakes" \
#     run nixpkgs#home-manager -- \
#     --extra-experimental-features \
#     "nix-command flakes" switch \
#     --flake nix/#$USER

nix run  \
    --extra-experimental-features 'nix-command flakes' \
    nix

