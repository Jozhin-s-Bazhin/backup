{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ", preferred, auto, 1"
      "eDP-1, preferred, 0x0, 1"
      "desc:Huawei Technologies Co. Inc. ZQE-CAA 0xC080F622, preferred, 1760x-1440, 1"
    ];

    windowrulev2 = [
      # XWaylandvideobridge
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"
    ];

    workspace = [
      "special,gapsin:10,gapsout:20,bordersize:10"
    ];
  };
}
