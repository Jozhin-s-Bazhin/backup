{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE, 24"
      "QT_QPA_PLATFORMTHEME, qt5ct"
    ];

    exec-once = [
      "waybar"
      "hyprpaper"
      "hypridle"
    ];
  };

  xdg.configFile."hypr/hypridle.conf".text = import ./hypridle.conf;
}
