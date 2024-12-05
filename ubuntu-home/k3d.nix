{ pkgs, lib, ... }:

let
  # Define the k3d package
  k3d = pkgs.stdenv.mkDerivation rec {
    pname = "k3d";
    version = "5.4.8";  # Replace with the desired version

    # Fetch the k3d binary
#    src = pkgs.fetchurl {
#      url = "https://github.com/k3d-io/k3d/releases/download/v${version}/k3d-linux-amd64";
#      sha256 = "0ys1wh24dl7gql4i5srjpamcf2nhsqsbs5z4i0b72h5a57fv9m6w";  # Update with the correct sha256
#    };

    # Installation steps
    installPhase = ''
      mkdir -p $out/bin

      curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | K3D_INSTALL_DIR="$out/bin" bash

#      install -m755 $src $out/bin/k3d
    '';

    # Package metadata
    meta = with lib; {
      description = "Helper to run Rancher Lab's k3s in Docker";
      homepage = "https://github.com/k3d-io/k3d";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };
in
{
  # Add k3d to your user's packages
  home.packages = [ k3d ];
}
