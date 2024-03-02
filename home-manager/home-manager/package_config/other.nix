{ config, pkgs, ... }:

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

  programs.neovim = {
    enable = true;
    extraConfig = ''
      inoremap jk <Esc>
    ''
}
