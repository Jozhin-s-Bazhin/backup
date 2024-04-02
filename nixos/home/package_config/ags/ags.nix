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
    --opacity: ${toString colors.opacity};
    --opacity-secondary: ${toString colors.opacity_secondary};

    --accent: ${colors.nixToHex colors.accent};
    --background: ${colors.nixToHex colors.background};
    --background-darker: ${colors.nixToHex colors.background_darker};
  '';
}
