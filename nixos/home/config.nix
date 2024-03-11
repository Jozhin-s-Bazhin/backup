# Here lives shit I don't understand
{ pkgs, config, ... }:
{
  home.username = "roman";
  home.homeDirectory = "/home/roman";
  home.stateVersion = "23.11"; # Do not change

  # Create systemd service to lock session before sleep
  systemd.user.services.lockScreenBeforeSleep = {
    description = "Lock screen before sleep";
    wantedBy = [ "sleep.target" ];
    before = [ "sleep.target" ]; # Ensure this is a simple list of strings
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
