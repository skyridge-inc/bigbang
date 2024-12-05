# docker-rootless.nix
{ config, pkgs, ... }: {
    # Install and config docker rootless
    programs.docker = {
        enable = true;
        package = pkgs.docker; # Optionally specify the Docker package
        # Optional: Automatically add your user to the docker group
        # This requires you to log out and back in for group changes to take effect
        userGroups = [ "docker" ];
    };

    services.docker.enable = true; # Optional: Enable Docker as a system service

}