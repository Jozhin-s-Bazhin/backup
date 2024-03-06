#  _   _    ____    _    _   _____
# | | | |  / __ \  | \  / | |  ___|
# | |_| | | |  | | |  \/  | | |__
# |  _  | | |  | | | |\/| | |  __|
# | | | | | |__| | | |  | | | |___
# |_| |_|  \____/  |_|  |_| |_____|

# By Roman Bezroutchko


{ config, pkgs, ... }:

{
  imports = [
    ./package_config/package_config.nix
    ./config.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Essentials
    floorp
    kitty

    # Hyprland
    (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }))
    mako
    libnotify
    wofi
    nerdfonts
    brightnessctl


    hyprpaper
    hypridle
    inputs.hyprlock.default

    # Other
    vscodium 
    lutris
    libreoffice
    qbittorrent
    vlc

    # CLI utilities
    eza
    zoxide
    bat
    graphicsmagick
  ];
}
