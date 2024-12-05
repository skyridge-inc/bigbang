{
  description = "A simple flake to include the hello program";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      SYSTEM_TYPE = "x86_64-linux";
#      SYSTEM_TYPE = "${builtin.currentSystem}";
    in {
      packages.${SYSTEM_TYPE}.default = nixpkgs.legacyPackages.${SYSTEM_TYPE}.hello;
#      packages.${SYSTEM_TYPE}.default = nixpkgs.legacyPackages.${SYSTEM_TYPE}.lolcat;

    };
}
