{
  description = "A flake that provides cowsay, lolcat, and hello packages";

  inputs = {
#    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = builtins.currentSystem;
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system}.default = pkgs.buildEnv {
      name = "my-packages";
      paths = with pkgs; [ cowsay lolcat hello ];
    };
  };
}
