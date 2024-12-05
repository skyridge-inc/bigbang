# oh-my-zsh.nix
{ config, pkgs, ... }: {
    # Install and config zsh
    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;

    };

}