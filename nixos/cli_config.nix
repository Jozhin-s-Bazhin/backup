{ config, pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    neovim
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
      vi = "nvim";
      vim = "nvim";

      # basic 
      ls = "eza -l";
      cd = "z";
      grep = "grep --color=auto";
      cat = "bat";

      # Misc
      c = "codium .";
      clip = "kitten clipboard";

      # Nix rebuilds
      rbs = "bash /home/roman/scripts/rebuild-aliases/rebuild-switch";
    };
  };
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  # nvim
  programs.neovim = {
    enable = true;
    configure.customRC = ''
      inoremap jk <Esc>
    '';
  };
}
