{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins = [
    #inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    /nix/store/cb7jyqfw13fakgj2q9w25dzadgc6033a-Hyprspace-0.1/lib/libHyprspace.so
  ];
}
