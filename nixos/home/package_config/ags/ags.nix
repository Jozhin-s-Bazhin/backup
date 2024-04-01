#             _____   _____
#     /\     / ____| / ____|
#    /  \   | |  __  | (___  
#   / /\ \  | | |_ | \___  \ 
#  / ____ \ | |__| |  ____) |
# /_/    \_\ \_____| |_____/ 
                        
# By Roman Bezroutchko

{ inputs, config, pkgs, ... }:

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

  home.file.".config/ags/".source = ./.;
  home.file.".config/ags/colors.css".text = ''
    :root {
      #--accent: ${colors.accent};
      --background: ${colors.hexToRGB colors.nixToHex colors.background};
    };
  '';
}
