# Here lives shit I don't understand
{ pkgs, config, ... }:
{
  home.username = "roman";
  home.homeDirectory = "/home/roman";
  home.stateVersion = "23.11"; # Do not change

  # Enable XDG desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  programs.home-manager.enable = true;
}
