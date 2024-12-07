#!/bin/bash

SERVER_IP="10.10.16.11" #(Change this value, if you need remote kubectl access)

# Create image cache directory
IMAGE_CACHE=${HOME}/.k3d-container-image-cache

mkdir -p ${IMAGE_CACHE}

k3d cluster create \
  --k3s-arg "--tls-san=$SERVER_IP@server:0" \
  --volume /etc/machine-id:/etc/machine-id \
  --volume ${IMAGE_CACHE}:/var/lib/rancher/k3s/agent/containerd/io.containerd.content.v1.content \
  --k3s-arg "--disable=traefik@server:0" \
  --port 80:80@loadbalancer \
  --port 443:443@loadbalancer \
  --api-port 6443

systemctl --user enable --now podman.socket
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/podman/podman.sock
