{ pkgs, ... }: {
 
  # By declaring directly their package name.
  # Using this way will only install the package.
  home.packages = with pkgs; [
    k3d
  ];
 
  # Sometimes, there's an option for that. You can check directly in https://mynixos.com.
  # You can use this syntax if you want to use default options set by home-manager or if
  # some other package needs to know if your package is enabled or not (e.g. stylix).
  programs.k3d = {
    enable = true;
  };
}
