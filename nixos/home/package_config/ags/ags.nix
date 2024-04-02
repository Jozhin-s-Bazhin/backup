#             _____   _____
#     /\     / ____| / ____|
#    /  \   | |  __  | (___  
#   / /\ \  | | |_ | \___  \ 
#  / ____ \ | |__| |  ____) |
# /_/    \_\ \_____| |_____/ 
                        
# By Roman Bezroutchko

{ inputs, lib, pkgs, ... }:

let
  colors = import ../variables/colors.nix;
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
  home.file.".config/ags/bar/".source = ./bar;
  home.file.".config/ags/colors.css".text = ''
    @define-color accent #${colors.nixToHex colors.accent};
    @define-color background rgba(${background.r}, ${background.g}, ${background.b}, ${toString colors.opacity});
    @define-color background-darker rgba(${background_darker.r}, ${background_darker.g}, ${background_darker.b}, ${toString colors.opacity});
  '';
}
