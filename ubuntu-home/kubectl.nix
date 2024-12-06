{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.kubectl
  ];
}
