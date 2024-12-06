{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.kustomize
  ];
}
