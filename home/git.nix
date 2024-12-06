# git.nix
{ config, pkgs, ... }: {
    # Install and config git
    programs.git = {
        enable = true;
        userName = "Ubuntu User";
        userEmail = "ubuntu@user.com";
    };
}