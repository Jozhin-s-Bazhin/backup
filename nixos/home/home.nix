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
    ./config.nix ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Applications
    floorp
    kitty
    qbittorrent
    vlc
    vscodium 
    spotube
    whatsapp-for-linux
    webcord
    #dissent
    libreoffice
    bitwarden
    thunderbird
    piper
    pavucontrol

    # CLI utilities
    yazi
    graphicsmagick
    radeontop

    # Goofy ah
    neofetch 
    fastfetch
    lolcat
    sl
    cmatrix
    pipes-rs
    freesweep
    btop

    # My own shit
    inputs.game-setting-manager.packages.${system}.gsm-cli
    #inputs.pyprland.packages.${pkgs.system}.pypr

    # Hyprland
    hyprpaper
    hypridle
    inputs.hyprlock.packages.x86_64-linux.hyprlock 
    #swaylock
    libnotify 
    nerdfonts 
    montserrat
    qt5.qtbase
    qt6.qtbase
    brightnessctl
    wl-clipboard-rs
    cliphist
    wirelesstools
    grimblast
    pyprland
    anyrun
    wluma

    flat-remix-gtk

    /*# GNOME
    flat-remix-gnome

    # Extensions
    gnomeExtensions.forge
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.switch-workspaces-on-active-monitor*/

    # Games
    crrcsim
    (lutris.override {
      extraPkgs = pkgs: [
      	# War thunder
       gtk3
	pango
	gamescope
	fontconfig
	
	  /*xorg.libXrandr
  xorg.libX11
  glib
  gdk-pixbuf
  stdenv.cc.cc.lib*/

      ];
    })
    prismlauncher
    gamescope
  ];
}
