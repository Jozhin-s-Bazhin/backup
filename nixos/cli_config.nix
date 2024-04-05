{ config, pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    htop
    killall
    eza
    zoxide
    bat
    direnv
    tldr
  ];

  # Config for cli utilities
  # zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    vteIntegration = true;

    # Init
    interactiveShellInit  = ''
      # Zoxide
      eval "$(zoxide init --cmd cd zsh)"

      # Direnv
      eval "$(direnv hook zsh)"

      # Yazi
      function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
      }
    '';

    # Aliases
    shellAliases = {
      # nvim
      v = "nvim";

      # basic 
      ls = "eza -l --git --sort 'modified'";
      grep = "grep --color=auto";
      cat = "bat";

      # Misc
      c = "codium . && exit";
      clip = "kitten clipboard";

      # Nix rebuilds
      rbs = "bash /etc/nixos/home/scripts/rebuild-aliases/rebuild-switch";
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
