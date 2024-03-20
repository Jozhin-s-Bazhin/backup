{ lib, config, pkgs, ... }:

let 
  colors = import ./variables/colors.nix { inherit lib; };
in
{
  # GTK
  gtk = {
    enable = true;
    font = {
      name = "Sans";
      size = 11;
    };
  };

  # Kitty
  programs.kitty = {
    enable = true;
    settings = {
      background = "#${colors.nixToHex colors.background_darker}";
      background_opacity = toString colors.opacity;
      confirm_os_window_close = "0";
      window_padding_width = "3";
      font = "UbuntuMono Nerd Font";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Jozhin-s-Bazhin";
    userEmail = "rbezroutchko@gmail.com";
  };

  # VSCode
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      ms-python.python
      ms-python.vscode-pylance
      jnoortheen.nix-ide
    ];
    userSettings = {
      vscode-neovim.neovimExecutablePaths.linux = "${pkgs.neovim}/bin/nvim";
      extensions.experimental.affinity."asvetliakov.vscode-neovim" = 1;
      "git.confirmSync" = false;
    };
    keybindings = [
      {
        "command" = "vscode-neovim.compositeEscape1";
        "key" = "j";
        "when" = "neovim.mode == insert && editorTextFocus";
        "args" = "j";
      }
      {
        "command" = "vscode-neovim.compositeEscape2";
        "key" = "k";
        "when" = "neovim.mode == insert && editorTextFocus";
        "args" = "k";
      }
    ];
  };
}
