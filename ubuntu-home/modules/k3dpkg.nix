{ config, pkgs, ... }:
let
  dog = "cat";
#  howdyCmd = pkgs.writeShellScriptBin "howdy" ''
#    echo "Howdy, partner"
#  '';
in {
  home.packages = [
    pkgs.k3d
  ];
}
