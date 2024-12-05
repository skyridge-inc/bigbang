# docker 
{ config, pkgs, ... }: {
    # Install and config zsh
    virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;

    };

}