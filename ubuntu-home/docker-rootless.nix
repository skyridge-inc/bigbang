{ config, pkgs, ... }:

{
  # Install the necessary packages.
  home.packages = [
    pkgs.docker
    pkgs.rootlesskit
    pkgs.slirp4netns
  ];

  # Create directories for the runtime socket.
  home.file = {
    ".docker".directories = {
      create = true;
      # Mode, owner, group can be adjusted if needed.
    };
    ".docker/run".directories = {
      create = true;
    };
  };

  # Define the user-level systemd service for rootless Docker.
  systemd.user.services.docker = {
    WantedBy = [ "default.target" ];
    After = [ "network-online.target" ];
    Service = {
      Environment = {
        # The runtime directory for the rootless Docker socket
        XDG_RUNTIME_DIR = "${config.home.homeDirectory}/.docker/run";
        DOCKER_HOST = "unix://${config.home.homeDirectory}/.docker/run/docker.sock";
      };
      ExecStartPre = "${pkgs.docker}/bin/dockerd-rootless-setuptool.sh install";
      ExecStart = "${pkgs.docker}/bin/dockerd-rootless.sh --experimental";
      KillMode = "process";
      Delegate = true;
      Type = "notify";
      Restart = "on-failure";
    };
  };

  # Optionally set environment variables globally for convenience.
  # This ensures the Docker client knows where the daemon socket is.
  programs.bash.initExtra = ''
    export DOCKER_HOST=unix://${HOME}/.docker/run/docker.sock
  '';
}
