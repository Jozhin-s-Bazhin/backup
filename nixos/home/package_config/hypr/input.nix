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
	#disable_while_typing = false;
      };
      sensitivity = 0;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_cancel_ratio = "0.1";
    };
  };
}
