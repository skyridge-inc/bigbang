# docker-rootless.nix
{ config, pkgs, ... }: {
    # Install and config docker rootless
    #
    # WARNING!!!!!
    # NEED TO RUN "sudo apt-get install uidmap"
    # REF:  https://github.com/NixOS/nixpkgs/issues/138423
    #
    services.podman = {
        enable = true;
        # socket = "/var/run/docker.sock"; # This ensures Podman uses the Docker-compatible socket

        # Create a `docker` alias for podman, to use it as a drop-in replacement
        # dockerCompat = true;
        # Required for containers under podman compose to be able to talk to each other.
        # defaultNetwork.settings.dns_enabled = true;

        # Optional: Automatically add your user to the docker group
        # This requires you to log out and back in for group changes to take effect
        # userGroups = [ "docker" ];
    };

    home.packages = [
        pkgs.docker
    ];

    # You can optionally set up environment variables or other configurations to work with Docker
    # environment.variables.PODMAN_SOCKET = "/var/run/docker.sock";  # Ensure it's available in the environment
}
