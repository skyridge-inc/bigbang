#!/bin/bash

clear

nix profile remove hi 2> /dev/null

nix profile install .#default

cowsay "Installation successful!"

hello | lolcat
