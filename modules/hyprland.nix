{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi --show=drun";

      bind = [
        ", Print, exec, grimblast --freeze copy area"

        "$mod, q, exec, $terminal"
        "$mod, c, killactive"
        "$mod, m, exit"
        "$mod SHIFT, m, exec, pkill Hyprland"
        "$mod, v, togglefloating"
        "$mod, r, exec, $menu"
        "$mod, p, pseudo"
        "$mod, j, togglesplit"

        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod, s, togglespecialworkspace, magic"
        "$mod SHIFT, s, movetoworkspace, special:magic"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ] ++ (
          builtins.concatLists (builtins.genList (
              x: let
                ws = toString (x + 1);
                key = if ws == "10" then "0" else ws;
              in [
                "$mod, ${key}, workspace, ${ws}"
                "$mod SHIFT, ${key}, movetoworkspace, ${ws}"
              ]
            ) 10)
        );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      exec-once = [ "waybar" ];

      input = {
        kb_layout = "br";
        follow_mouse = 2;
        accel_profile = "flat";
        sensitivity = 0;
      };

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 1;

        "col.active_border" = "rgba(f38ba8ff) rgba(fab387ff)";
        "col.inactive_border" = "rgba(45475aff)";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1;
        inactive_opacity = 0.97;

        shadow.enabled = false;

        blur = {
          enabled = true;
          size = 12;
          passes = 3;
          vibrancy = 0.2696;
        };
      };

      animations.enabled = "no, thanks :3";
      gesture = "3, horizontal, workspace";
    };
  };

  services.hyprpolkitagent.enable = true;
}
