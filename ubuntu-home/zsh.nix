# oh-my-zsh.nix
{ config, pkgs, ... }: {
    # Install and config zsh
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        # autosuggestions.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch";
        };
        history = {
            size = 10000;
            path = "${config.xdg.dataHome}/zsh/history";
        };
        #####################################
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" "kubectl" "pyenv" "docker" "argocd" "aws" "docker-compose" "kube-ps1" "kubectl" "kubectx" "kind" "helm" "istioctl" ];
            theme = "robbyrussell";
        };
    };

}