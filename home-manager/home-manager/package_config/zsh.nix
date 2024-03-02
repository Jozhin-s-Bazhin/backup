{ config, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;

    # Aliases
    shellAliases = {

      # Basic stuff
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      # Nix rebuilds
      rbs = "bash ~/scripts/rebuild-aliases/rebuild-switch";
      rbh = "bash ~/scripts/rebuild-aliases/home-switch";
      rba = "bash ~/scripts/rebuild-aliases/backup";
    };
  };
}
