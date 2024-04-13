{ pkgs, config, ... }:

{
  imports = [
    ./other.nix
    ./ags/ags.nix
    ./hypr/hyprland.nix
  ];
}
