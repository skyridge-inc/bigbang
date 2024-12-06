{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.k3d
  ];
}
