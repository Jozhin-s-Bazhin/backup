#             _____   _____
#     /\     / ____| / ____|
#    /  \   | |  __  | (___  
#   / /\ \  | | |_ | \___  \ 
#  / ____ \ | |__| |  ____) |
# /_/    \_\ \_____| |_____/ 
                        
# By Roman Bezroutchko

{ inputs, config, pkgs, ... }:
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

  xdg.configFile = {
    "ags/config.js".source = ./config.js;
  };
}
