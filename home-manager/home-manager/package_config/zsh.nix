{ config, pkgs, ... }:

{ 
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;

    # Init
    interactiveShellInit = ''
      eval "$(zoxide init zsh)"
    '';

    # Aliases
    shellAliases = {

      # Basic stuff
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      c = "codium .";
      l = "eza -la";

      # Nix rebuilds
      rbs = "bash ~/scripts/rebuild-aliases/rebuild-switch";
      rbh = "bash ~/scripts/rebuild-aliases/home-switch";
      rba = "bash ~/scripts/rebuild-aliases/backup";
    };

  };
}
