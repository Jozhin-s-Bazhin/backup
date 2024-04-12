{ config, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins = [
    inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
  ];
}
