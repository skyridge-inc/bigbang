{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.kubernetes-helm
  ];
}
