{ config, pkgs, ... }:
{
  imports = [
    ./modules/k3dpkg.nix
  ];

  # programs.k3d.enable = true;
  # Optionally specify a version:
  # programs.k3d.version = "v5.7.5";
}
