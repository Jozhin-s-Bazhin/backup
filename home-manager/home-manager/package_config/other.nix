{ lib, config, pkgs, ... }:

let 
  colors = import ./variables/colors.nix { inherit lib; };
in
{
  # Git
  programs.git = {
    enable = true;
    userName = "Jozhin-s-Bazhin";
    userEmail = "rbezroutchko@gmail.com";
  };

  # GTK
  gtk = {
    enable = true;
    font = {
      name = "Sans";
      size = 11;
    };
  };

  # Neovim
  programs.neovim = {
    enable = true;
    extraConfig = ''
      inoremap jk <Esc>
    '';
  };

  # Kitty
  programs.kitty = {
    enable = true;
    settings = {
      background = "#${colors.nixToHex colors.background}";
      background_opacity = toString colors.opacity_secondary;
    };
  };
}
