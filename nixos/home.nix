#  _   _    ____    _    _   _____
# | | | |  / __ \  | \  / | |  ___|
# | |_| | | |  | | |  \/  | | |__
# |  _  | | |  | | | |\/| | |  __|
# | | | | | |__| | | |  | | | |___
# |_| |_|  \____/  |_|  |_| |_____|

# By Roman Bezroutchko


{ inputs, config, pkgs, ... }:

{
  imports = [
    ./home/package_config/package_config.nix
    ./home/config.nix
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
    inputs.hyprlock.packages.x86_64-linux.hyprlock

    # Other
    vscodium 
    lutris
    libreoffice
    qbittorrent
    vlc

    # CLI utilities
    graphicsmagick
  ];
}