#!/bin/bash

nix run home-manager/master -- init --switch .

home-manager switch --flake .
