#  _   _   _____  _     _    ____      ___
# | \ | | |_   _| \ \ / /   / __ \   / ___|
# |  \| |   | |    \ V /   | |  | | | (_
# | . ` |   | |     > <    | |  | |  \_  \
# | |\  |  _| |_   / . \   | |__| |  __)  |
# |_| \_| |_____| /_/ \_\   \____/  |____/

# By Roman Bezroutchko


{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable automatic upgrade
  system.autoUpgrade.enable = true;

  # Define your hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Experimental settings
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure keymap in X11
  services.xserver = {
    # Plasma 6
    #enable = true;
    #displayManager.sddm.enable = true;
    #desktopManager.plasma6.enable = true;

    xkb.layout = "us";
    xkb.variant = "";

    # Nvidia
    videoDrivers = [ "nvidia" ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.roman = {
    isNormalUser = true;
    description = "Roman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    htop
    home-manager
    killall
  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  # Greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
        user = "roman";
      };
    };
  };

  # Hyprland
  programs.hyprland.enable = true;

  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  ## NVIDIA BS
  # something for hyprland
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocation=1" ];

  # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    # Required
    modesetting.enable = true;
    
    # Sleep issues
    powerManagement.enable = true;
    powerManagement.finegrained = false;  # Leave off
  
    # Open-source drivers (not nouveau)
    open = false;

    # Something settings
    nvidiaSettings = true;

    # PRIME
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  
  # Do not touch
  system.stateVersion = "23.11";
}
