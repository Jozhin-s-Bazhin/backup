{ config, pkgs, ... }:

let
  # Workspace bindings
  workspaces_num = [ 1 2 3 4 5 6 7 8 9 ];
  generateWorkspace = num: "SUPER, ${toString num}, exec, pypr workspace ${toString num}";
  generateMoveToWorkspace = num: "SUPER SHIFT, ${toString num}, exec, pypr movetoworkspace ${toString num}";
  workspaceBindings = (map generateWorkspace(workspaces_num)) ++ (map generateMoveToWorkspace(workspaces_num));

in 
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Controls
      "SUPER, Space, killactive"
      "SUPER, Caps, overview:toggle"

      # Focus
      "SUPER, H, movefocus, l"
      "SUPER SHIFT, H, movewindow, l"
      "SUPER, J, movefocus, d"
      "SUPER SHIFT, J, movewindow, d"
      "SUPER, K, movefocus, u"
      "SUPER SHIFT, K, movewindow, u"
      "SUPER, L, movefocus, r"
      "SUPER SHIFT, L, movewindow, r"

      # Window position
      "SUPER, F11, fullscreen"
      "SUPER, V, togglefloating"

      # Power key
      #", XF86PowerOff, exec, /etc/nixos/homw/scripts/misc/lockBeforeSleep"

      # Applications
      "SUPER, Tab, exec, ags -t applauncher"
      "SUPER, Return, exec, kitty"
      "SUPER, B, exec, floorp"
      "SUPER, C, exec, codium"

      # Scratchpad
      "SUPER, Backspace, togglespecialworkspace"
      "SUPER SHIFT, Backspace, movetoworkspace, special"
    ] 
    ++
    workspaceBindings;

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    binde = [
      # Audio
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Brightness
      ", XF86MonBrightnessUp, exec, brightnessctl -s set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -s set 5%- -n 1"
    ];

    bindl = [
      ", switch:on:Lid Switch, exec, /etc/nixos/home/scripts/misc/lockBeforeSleep"
    ];
  };
}
