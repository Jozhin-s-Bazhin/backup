{ config, pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland.plugins = [
    inputs.Hyprspace.packages."${pkgs.system}".Hyprspace
    #inputs.hy3.packages.x86_64-linux.hy3
  ];

  wayland.windowManager.hyprland.settings = {
    plugin = {
      overview = {
        panelColor = "00ff0000";
	panelHeight = "150";
	showEmptyWorkspace = false;
      };
    };
  };
}
