{ config, pkgs, ... }:

let
  # Workspace bindings
  workspaces_num = [ 1 2 3 4 5 6 7 8 9 ];
  generateWorkspace = num: "SUPER, ${toString num}, workspace, ${toString num}";
  generateMoveToWorkspace = num: "SUPER SHIFT, ${toString num}, movetoworkspace, ${toString num}";
  workspaceBindings = (map generateWorkspace(workspaces_num)) ++ (map generateMoveToWorkspace(workspaces_num));

in 
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Controls
      "SUPER, Space, killactive"

      "SUPER, H, movefocus, l"
      "SUPER SHIFT, H, movewindow, l"
      "SUPER, J, movefocus, d"
      "SUPER SHIFT, J, movewindow, d"
      "SUPER, K, movefocus, u"
      "SUPER SHIFT, K, movewindow, u"
      "SUPER, L, movefocus, r"
      "SUPER SHIFT, L, movewindow, r"

      "SUPER, F11, fullscreen"
      "SUPER, V, togglefloating"

      # Important applications
      "SUPER, Tab, exec, wofi --show drun"
      "SUPER, Return, exec, kitty"
      "SUPER, B, exec, floorp"

      # Other applications
    ] 
    ++
    workspaceBindings;

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    binde = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ];
  };
}
