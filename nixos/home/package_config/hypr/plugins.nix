{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins = [
    # ... whatever
    inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
  ];
}
