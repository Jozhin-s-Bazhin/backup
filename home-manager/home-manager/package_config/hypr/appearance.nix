{ lib, config, pkgs, ... }:

let 
  colors = import ../variables/colors.nix { inherit lib; };
  misc = import ../variables/misc.nix;
  accent = colors.nixToHex colors.accent;
  background = colors.nixToHex colors.background;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;
      "col.active_border" = "rgba(${accent}ff)";
      "col.inactive_border" = "rgba(${background}ff)";

      layout = "dwindle";

      allow_tearing = false; }; decoration = { rounding = 10;

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        
        vibrancy = 0.1696;
      };

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = true;
      bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.05" ];
      animation = [ 
	"windows, 1, 7, myBezier"
    	"windowsOut, 1, 7, default, popin 80%"
    	"border, 1, 10, default"
    	"borderangle, 1, 8, default"
 	"fade, 1, 7, default"
    	"workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_is_master = true;
    };

    misc = {
      force_default_wallpaper = 1;
    };
  };

  xdg.configFile."hypr/hyprpaper.conf" = ''
    preload = ${misc.wallpaper}
  '';
}
