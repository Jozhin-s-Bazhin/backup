{ config, pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    htop
    killall
    eza
    zoxide
    bat
  ];

  # Config for cli utilities
  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    vteIntegration = true;

    # Init
    shellInit  = ''
      eval "$(zoxide init zsh)"
    '';

    # Aliases
    shellAliases = {
      # nvim
      v = "nvim";

      # basic 
      ls = "eza -l --git --sort 'modified'";
      cd = "z";
      grep = "grep --color=auto";
      cat = "bat";

      # Misc
      c = "codium .";
      clip = "kitten clipboard";

      # Nix rebuilds
      rbs = "bash /home/roman/scripts/rebuild-aliases/rebuild-switch";
      #rbu = "bash /home/roman/scripts/rebuild-aliases/rebuild-upgrade";
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  # nvim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    configure.customRC = ''
      inoremap jk <Esc>
      set ignorecase
    '';
  };
}
