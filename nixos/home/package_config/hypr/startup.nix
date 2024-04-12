{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_SIZE, 24"
      "QT_QPA_PLATFORMTHEME, qt5ct"
    ];

    exec-once = [
      # Polkit
      "lxqt-policykit-agent"

      # Clipboard manager
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      # Startup apps
      "floorp &"

      # Other
      "hyprpaper"
      "hypridle"
      "ags"
      "pypr"
      "hyprctl dispatch workspace 2"
    ];
  };

  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
}
