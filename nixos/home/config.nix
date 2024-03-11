# Here lives shit I don't understand
{ pkgs, config, ... }:
{
  home.username = "roman";
  home.homeDirectory = "/home/roman";
  home.stateVersion = "23.11"; # Do not change

  # Create systemd service to lock session before sleep
  systemd.user.services.lock-before-sleep = {
    description = "Lock session before sleep";
    partOf = [ "sleep.target" ];
    before = [ "sleep.target" ];
    wantedBy = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/loginctl lock-session & sleep 3";
    };
  };

  # Enable XDG desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  programs.home-manager.enable = true;
}
