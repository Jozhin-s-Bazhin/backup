# Here lives shit I don't understand
{ pkgs, config, ... }:
{
  home.username = "roman";
  home.homeDirectory = "/home/roman";
  home.stateVersion = "23.11"; # Do not change

  # Create systemd service to lock session before sleep
  #systemd.user.services.lockBeforeSleep = {
  #  Unit = {
  #    Description = "Lock screen before system sleep, suspend, or hibernate";
  #    Before = [ "sleep.target" ];
  #  };
  #  Install = {
  #    WantedBy = [ "suspend.target" ];
  #  };
  #  Service = {
  #    Type = "oneshot";
  #    ExecStart = "${pkgs.systemd}/bin/loginctl lock-session && sleep 3";
  #  };
  #};

  # Enable XDG desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  programs.home-manager.enable = true;

  # WLUMA config
  xdg.configFile."wluma/config.toml".text = ''
[als.iio]
path = "/sys/bus/iio/devices"
thresholds = { 0 = "night", 20 = "dark", 80 = "dim", 250 = "normal", 500 = "bright", 800 = "outdoors" }

[[output.backlight]]
name = "eDP-2"
path = "/sys/class/backlight/amdgpu_bl2"
capturer = "wlroots"
  '';
}
