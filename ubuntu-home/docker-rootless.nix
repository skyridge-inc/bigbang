{ config, pkgs, lib, ... }:

let
  docker = pkgs.docker;
  dockerRootlessExtras = pkgs.dockerRootlessExtras;
  path = with pkgs; lib.makeBinPath [
    coreutils findutils gnugrep gnused gawk iproute procps shadow util-linux docker dockerRootlessExtras
  ];
in
{
  # Install Docker and rootless extras
  home.packages = [ docker dockerRootlessExtras ];

  # Set necessary environment variables
  home.sessionVariables = {
    DOCKER_HOST = ''unix://$XDG_RUNTIME_DIR/docker.sock'';
    PATH = "${dockerRootlessExtras}/bin:${docker}/bin:${config.home.sessionVariables.PATH}";
  };

  # Create required directories with proper permissions using home.file
  home.file.".local/share/docker" = {
    directory = true;
    mode = "0700";
  };
  home.file.".config/docker" = {
    directory = true;
    mode = "0700";
  };

  # Configure Docker daemon settings
  xdg.configFile."docker/daemon.json".text = ''
    {
      "experimental": true,
      "data-root": "${config.home.homeDirectory}/.local/share/docker"
    }
  '';

  # Define the systemd user service for Docker rootless
  systemd.user.services.docker = {
    description = "Docker Rootless Daemon";
    after = [ "network.target" ];
    serviceConfig = {
      Environment = "PATH=${path}";
      ExecStart = "${dockerRootlessExtras}/bin/dockerd-rootless.sh";
      Restart = "always";
    };
    wantedBy = [ "default.target" ];
  };

  # Ensure systemd services are started
  systemd.user.startServices = true;
}
