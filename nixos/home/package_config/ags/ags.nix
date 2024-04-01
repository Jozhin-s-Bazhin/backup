#             _____   _____
#     /\     / ____| / ____|
#    /  \   | |  __  | (___  
#   / /\ \  | | |_ | \___  \ 
#  / ____ \ | |__| |  ____) |
# /_/    \_\ \_____| |_____/ 
                        
# By Roman Bezroutchko

{ lib, ... }:

let
  colors = import ../variables/colors.nix;
  background = colors.hexToRGB colors.background;
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

  home.file.".config/ags/".source = ./.;
  home.file.".config/ags/colors.css".text = ''
    :root {
      --background: (${background.r}, ${background.g}, ${background.b});
    };
  '';
}
