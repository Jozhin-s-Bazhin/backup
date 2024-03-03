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
    ./package_config/package_config.nix
    ./config.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Essentials
    floorp
    kitty
    (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }))
    mako
    libnotify
    hyprpaper
    wofi
    nerdfonts

    # Other
    vscodium 
    lutris
    libreoffice
    qbittorrent

    # CLI utilities
    eza
    zoxide
  ];
}
