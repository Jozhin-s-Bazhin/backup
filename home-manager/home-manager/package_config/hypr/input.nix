{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model ="";
      kb_options ="";
      kb_rules ="";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };
      sensitivity = 0;
    };

    gestures = {
      workspace_swipe = true;
    };
  };
}
