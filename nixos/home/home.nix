#  _   _    ____    _    _   _____
# | | | |  / __ \  | \  / | |  ___| | |_| | | |  | | |  \/  | | |__ |  _  | | |  | | | |\/| | |  __| | | | | | |__| | | |  | | | |___
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
    # Applications
    floorp
    kitty
    lutris
    qbittorrent
    vlc
    vscodium 
    spotube
    whatsapp-for-linux
    libreoffice
    bitwarden
    thunderbird

    # Hyprland
    wofi
    hyprpaper
    hypridle
    inputs.hyprlock.packages.x86_64-linux.hyprlock
    libnotify
    nerdfonts
    cantarell-fonts
    qt5.qtbase
    qt6.qtbase
    brightnessctl
    cliphist
    fluent-gtk-theme
    pyprland.override { extraPackages = [ nerdfonts ] }

    # CLI utilities
    yazi
    graphicsmagick

    # Goofy ah
    neofetch 
    fastfetch
    lolcat
    sl
    cmatrix
    pipes-rs
    freesweep

    # My own shit
    inputs.game-setting-manager.packages.${system}.gsm-cli
  ];
}
