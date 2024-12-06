{
  description = "Home Manager configuration of ubuntu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."ubuntu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        # REF:  https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/guides/deployment-scenarios/quickstart.md#step-1-provision-a-virtual-machine
        modules = [ 
          # PRE-INSTALL:  Install home-manager nix pkg
          ./home.nix
          # PRE-INSTALL:  Install zsh with oh-my-zsh and plugins  YEA!
          ./zsh.nix
          # STEP 1:  Install git
          ./git.nix
          # STEP 2/3/4:  Install podman (not docker) and alias docker to podman
          ./docker-rootless.nix
          # STEP 5/6:  Install k3d
          ./k3d.nix
          # STEP 7/8:  Install kubectl
          ./kubectl.nix
          # STEP 9/10:  Install kustomize
          ./kustomize.nix
          # STEP 11/12:  Install helm
          ./helm.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

