 _   _   _____  _     _    ____      ___
# | \ | | |_   _| \ \ / /   / __ \   / ___|
# |  \| |   | |    \ V /   | |  | | | (_
# | . ` |   | |     > <    | |  | |  \_  \
# | |\  |  _| |_   / . \   | |__| |  __)  |
# |_| \_| |_____| /_/ \_\   \____/  |____/

# By Roman Bezroutchko


{ inputs, pkgs, config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./cli_config.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    xkb.layout = "us";
    xkb.variant = "";

    # Nvidia
    videoDrivers = [ "nvidia" ];
  };

  # Enable printing
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.roman = {
    isNormalUser = true;
    description = "Roman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Logind
  services.logind.extraConfig = ''
    HandlePowerKey=hibernate
  '';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto-updates
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" 
    ];
    dates = "03:00";
    randomizedDelaySec = "60min";
  };

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
  #programs.hyprland = {
  #  enable = true;
  #  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  #};

  # Pipewire
  services.pipewire = {
    enable = true;
    audio.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };
  };

  # GTK fix
  programs.dconf.enable = true;

  # Better battery life
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
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
