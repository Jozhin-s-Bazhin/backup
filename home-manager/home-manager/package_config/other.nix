{ config, pkgs, ... }:

let 
  colors = import ../variables/colors.nix;
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
      background_color = ""
}
