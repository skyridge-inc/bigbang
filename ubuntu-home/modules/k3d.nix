{ config, lib, pkgs, ... }:
let
  cfg = config.programs.k3d;
in {
  options.programs.k3d = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to install the k3d CLI tool using the official install script.";
    };

    version = lib.mkOption {
      type = lib.types.str;
      default = "5.7.5";
      description = ''
        Which version (TAG) of k3d to install. For example: "v5.6.0".
        If set to "latest", the script will fetch the latest available version.
      '';
    };

    installDir = lib.mkOption {
      type = lib.types.path;
      default = "${config.home.homeDirectory}/.local/bin";
      description = "Directory to place the k3d binary.";
    };
  };

  config = lib.mkIf cfg.enable {
    # Ensure curl and bash are available
    home.packages = [
      pkgs.curl
      pkgs.bashInteractive
    ];

    # Run the installation script during activation
    home.activation.k3d = lib.mkAfter ''
      #!/usr/bin/env bash
      set -euo pipefail

      mkdir -p "${cfg.installDir}"
      export INSTALL_DIR="${cfg.installDir}"

      if [ "${cfg.version}" != "latest" ]; then
        TAG="${cfg.version}" ${pkgs.curl}/bin/curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh \
          | bash
#        TAG="${cfg.version}" ${pkgs.curl}/bin/curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh \
#          | ${pkgs.bashInteractive}/bin/bash
      else
        ${pkgs.curl}/bin/curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh \
          | ${pkgs.bashInteractive}/bin/bash
      fi
    '';

    # Add the install directory to PATH
    home.sessionVariables = {
      PATH = "${cfg.installDir}:$PATH";
    };
  };
}
