{ config, myLib, host, ... }:
let 
  monitorScalings = {
    "agovale" = "1.25";
    "ector" = "1";
  };
  pointer = config.home.pointerCursor;
in {
  wayland.windowManager.hyprland.settings = {
    monitor = ", preferred, auto, " + myLib.switch host monitorScalings;

    xwayland = {
      force_zero_scaling = true;
    };

    exec-once = [
      "dunst"
      "telegram-desktop"
      "discord"
      "hyprctl secursor ${pointer.name} ${toString pointer.size}"
      "eww daemon"
      "eww open bar"
    ];

    input = {
      kb_layout = "us, ua";
      kb_options = "grp:win_space_toggle";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = false;
      };

      sensitivity = 0; 
    };

    general = {
      gaps_in = 2;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";
    };

    decoration = {
      rounding = 5;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

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
      new_is_master = false;
    };

    windowrule = [
      "workspace special:messengers, org.telegram.desktop"
      "workspace special:messengers, discord"
    ];

    bind = [
# Basic Binds
      "SUPER, return, exec, wezterm"
      "SUPER, Q, killactive,"
      "SUPER, M, exit,"
      "SUPER, V, togglefloating, "
      "SUPER, R, exec, anyrun"
      "SUPER, P, pseudo,"
      "SUPER, J, togglesplit,"
      "SUPER SHIFT, S, exec, grimblast copy area"

# Move focus with mainMod + arrow keys
      "SUPER, left, movefocus, l"
      "SUPER, right, movefocus, r"
      "SUPER, up, movefocus, u"
      "SUPER, down, movefocus, d"

# Switch workspaces with mainMod + [0-9]
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"
      "SUPER, 6, workspace, 6"
      "SUPER, 7, workspace, 7"
      "SUPER, 8, workspace, 8"
      "SUPER, 9, workspace, 9"
      "SUPER, 0, workspace, 10"
      "SUPER, W, togglespecialworkspace, messengers"

# Move active window to a workspace with mainMod + SHIFT + [0-9]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"
      "SUPER SHIFT, 6, movetoworkspace, 6"
      "SUPER SHIFT, 7, movetoworkspace, 7"
      "SUPER SHIFT, 8, movetoworkspace, 8"
      "SUPER SHIFT, 9, movetoworkspace, 9"
      "SUPER SHIFT, 0, movetoworkspace, 10"
      "SUPER SHIFT, W, movetoworkspace, special:messengers"

# Scroll through existing workspaces with mainMod + scroll
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"

    ];

    bindl = [
# Volume controls
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bindm = [
# Move/resize windows with mainMod + LMB/RMB and dragging
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
