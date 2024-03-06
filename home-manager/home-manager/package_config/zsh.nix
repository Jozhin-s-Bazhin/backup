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
      # nvim
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      # Basic shit
      ls = "eza -l";
      cd = "z";
      grep = "grep --color=auto";
      cat = "bat";

      # Misc
      c = "codium .; exit";
      clip = "kitten clipboard";

      # Nix rebuilds
      rbs = "bash ~/scripts/rebuild-aliases/rebuild-switch";
      rba = "bash ~/scripts/rebuild-aliases/backup";
    };
  };
}
