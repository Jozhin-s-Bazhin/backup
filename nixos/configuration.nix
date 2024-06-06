# _   _   _____  _     _    ____      ___
# | \ | | |_   _| \ \ / /   / __ \   / ___|
# |  \| |   | |    \ V /   | |  | | | (_
# | . ` |   | |     > <    | |  | |  \_  \
# | |\  |  _| |_   / . \   | |__| |  __)  |
# |_| \_| |_____| /_/ \_\   \____/  |____/

# By Roman Bezroutchko


{ inputs, pkgs, config, lib, ... }:

{
  imports =
    [
      inputs.hyprland.nixosModules.default
      ./hardware-configuration.nix 
      ./cli_config.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Firmware updates
  services.fwupd.enable = true;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "usbcore.autosuspend=30"
  ];

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
    #videoDrivers = [ "nvidia" ];

    # AMD
    videoDrivers = [ "amd" ];

    # Gnome
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" "audio" "fuse" ];
    packages = with pkgs; [ lxqt.lxqt-policykit ];
  };

  # Logind
  services.logind = {
    #lidSwitch = "suspend";
    lidSwitch = "ignore";
    powerKey = "poweroff";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Auto-updates and cleanup
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
    persistent = true;
  };
  nix.optimise = {
    automatic = true;
    dates = [ "3:00" ];
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Fingerprint sensor
  services.fprintd.enable = true;

  # GNOME
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    gnome-terminal
    epiphany
    geary
    gnome-characters
  ]);

  # Cosmic
  #services.desktopManager.cosmic.enable = true;
  #services.displayManager.cosmic-greeter.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  /*# Greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland --config /etc/greetd/hyprland.conf";
        user = "roman";
      };
    };
  };
  environment.etc."greetd/hyprland.conf".source = ./home/package_config/ags/hyprland.conf;
  environment.etc."greetd/greeter.js".source = ./home/package_config/ags/greeter.js;*/

  # Pipewire
  #sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # Audio device switching
     extraConfig = ''
    [context.properties]
    # Add any global properties here if needed

    [rules]
    rules.add = [
      {
        matches = [
          {
            # Match all ALSA input devices
            "node.name" = "alsa_input.*"
          }
        ],
        actions = [
          {
            # Set a high priority for these devices
            "update-props" = {
              "priority.driver" = 2000;
            }
          }
        ]
      },
      {
        matches = [
          {
            # Match all ALSA output devices
            "node.name" = "alsa_output.*"
          }
        ],
        actions = [
          {
            # Set a high priority for these devices
            "update-props" = {
              "priority.driver" = 2000;
            }
          }
        ]
      }
    ];
  '';
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Kde connect
  services.dbus.enable = true;
  networking.firewall.allowedTCPPorts = [ 1714 1715 7860 ];
  networking.firewall.allowedUDPPorts = [ 1714 1715 1716 7860 ];

  # GTK fix
  programs.dconf.enable = true;

  # Fonts
  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Ubuntu Nerd Font" ];
    serif = [ "Ubuntu Nerd Font" ];
  };

  # Piper
  services.ratbagd.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };


  # Better battery life
  services.upower.enable = true;
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
  hardware.sensor.iio.enable = true;

  # Running non-NixOS binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Virtualisation
  #virtualisation.vmware.host.enable = true;
  #virtualisation.virtualbox.host.enable = true;
  virtualisation.docker = {
    enable = true;
    #enableNvidia = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # AMD
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ 
      amdvlk 
      driversi686Linux.amdvlk
      rocmPackages.clr.icd
   ];
  };

  /*## NVIDIA BS
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
  };*/
  
  # Do not touch
  system.stateVersion = "23.11";
}
