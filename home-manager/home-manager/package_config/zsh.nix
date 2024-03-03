{ config, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;

    # Init
    initExtra = ''
     eval "$(zoxide init zsh)"
    '';

    # Aliases
    shellAliases = {

      # Basic stuff
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      c = "codium .; exit";
      ls = "eza -l";
      cd = "z";
      grep = "grep --color=auto";

      # Nix rebuilds
      rbs = "bash ~/scripts/rebuild-aliases/rebuild-switch";
      rbh = "bash ~/scripts/rebuild-aliases/home-switch";
      rba = "bash ~/scripts/rebuild-aliases/backup";
    };

  };
}
