#!/bin/bash

clear

nix profile remove hi 2> /dev/null

nix profile install .#default

hello

cowsay "Installation successful!"

hello | lolcat

# clean up
nix profile remove hi 2> /dev/null
