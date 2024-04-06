{ lib, ... }:

let
  maxWorkspaceID = 2147483647;
  difference = maxWorkspaceID / 11;
  generateWorkspaceRule = num: toString (num * difference) + ", persistent";
  baseWorkspaces = lib.genList generateWorkspaceRule 9;
in
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ", preferred, auto, 1"
      "eDP-1, preferred, 0x0, 1"

      # Ultrawide at home
      "desc:Huawei Technologies Co. Inc. ZQE-CAA 0xC080F622, preferred, -720x-1440, 1"  # Above eDP-1

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
    ];

    workspace = [
      "special,gapsin:10,gapsout:20"
    ]
    ++
    baseWorkspaces;  # Each of these will be treated as if they are 1, 2, 3, ... But the difference will make it possible to insert new workspaces
  };
}
