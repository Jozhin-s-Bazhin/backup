{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ", preferred, auto, 1"
    ];

    windowrulev2 = [
      # XWaylandvideobridge
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"
    ];
  };
}
