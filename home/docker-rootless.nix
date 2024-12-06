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
        # Create a `docker` alias for podman, to use it as a drop-in replacement
        # dockerCompat = true;
        # Required for containers under podman compose to be able to talk to each other.
        # defaultNetwork.settings.dns_enabled = true;

        # Optional: Automatically add your user to the docker group
        # This requires you to log out and back in for group changes to take effect
        # userGroups = [ "docker" ];
    };

}