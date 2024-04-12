#             _____   _____
#     /\     / ____| / ____|
#    /  \   | |  __  | (___  
#   / /\ \  | | |_ | \___  \ 
#  / ____ \ | |__| |  ____) |
# /_/    \_\ \_____| |_____/ 
                        
# By Roman Bezroutchko

{ inputs, lib, pkgs, ... }:

let
  colors = import ../variables/colors.nix { inherit lib; };
  background = colors.nixToRGB colors.background;
  background_darker = colors.nixToRGB colors.background_darker;
in
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  home.file.".config/ags/config.js".source = ./config.js;
  home.file.".config/ags/colors.css".text = ''
    @define-color foreground #${colors.nixToHex colors.foreground};
    @define-color accent #${colors.nixToHex colors.accent};
    @define-color background rgba(${toString background.r}, ${toString background.g}, ${toString background.b}, ${toString colors.opacity});
    @define-color background-selected #${colors.nixToHex colors.background_selected};
    @define-color background-darker rgba(${toString background_darker.r}, ${toString background_darker.g}, ${toString background_darker.b}, ${toString colors.opacity});
  '';
  home.file.".config/ags/style.css".source = ./style.css;

  # Bar
  home.file.".config/ags/bar.js".source = ./bar.js;

  # Notifications
  home.file.".config/ags/notifications.js".source = ./notifications.js;
}
