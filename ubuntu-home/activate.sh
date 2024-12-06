#!/bin/bash

# WARNING:  Must manually install uidmap PRIOR to installing podman via home-manager
sudo apt-get update && sudo apt-get install uidmap

home-manager switch --flake .

# REF: https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/guides/deployment-scenarios/quickstart.md#step-1-provision-a-virtual-machine
#
# Istio-init requires these kernel modules loaded!
sudo grep -q '^xt_REDIRECT' /etc/modules || printf "xt_REDIRECT\n" | sudo tee -a /etc/modules
sudo grep -q '^xt_owner' /etc/modules || printf "xt_owner\n" | sudo tee -a /etc/modules
sudo grep -q '^xt_statistic' /etc/modules || printf "xt_statistic\n" | sudo tee -a /etc/modules

