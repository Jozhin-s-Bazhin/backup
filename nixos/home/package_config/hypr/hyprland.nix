#  _    ___     _______  _____  _               _   _ _____  
# | |  | \ \   / /  __ \|  __ \| |        /\   | \ | |  __ \ 
# | |__| |\ \_/ /| |__) | |__) | |       /  \  |  \| | |  | |
# |  __  | \   / |  ___/|  _  /| |      / /\ \ | . ` | |  | |
# | |  | |  | |  | |    | | \ \| |____ / ____ \| |\  | |__| |
# |_|  |_|  |_|  |_|    |_|  \_\______/_/    \_\_| \_|_____/ 

# By Roman Bezroutchko

{ inputs, config, pkgs, ... }:

{
  imports = [ # Startup
    ./startup.nix

    # Appearance
    ./appearance.nix

    # Input
    ./input.nix

    # Keybindings
    ./keybinds.nix

    # Plugins
    ./plugins.nix

    # Other
    ./other.nix
  ];  

  wayland.windowManager.hyprland.enable = true;
}
