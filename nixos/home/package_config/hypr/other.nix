{ lib, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ", preferred, auto, 1"
      "eDP-2, preferred, 0x0, 1.6"

      # Ultrawide at home
      "desc:Huawei Technologies Co. Inc. ZQE-CAA 0xC080F622, preferred, -3440x0, 1"  # Right of eDP-1

      # Monitor at home
      "desc:Iiyama North America PL2283H 1132555227963, preferred, 0x-1080, 1"  # Above eDP-1
    ];

    windowrulev2 = [
      # XWaylandvideobridge
      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"

      # LibreOffice
      "nofullscreenrequest,class:$libreoffice-*"
    ];

    workspace = [
      "special,gapsin:10,gapsout:20"
    ];
  };
}
