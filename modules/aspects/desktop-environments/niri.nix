{
  inputs,
  lib,
  den,
  ...
}: {
  den.aspects.desktop-environments.niri = {host}: {
    includes = with den.aspects; [
      services.awww
      fonts
    ];

    nixos = {pkgs, ...}: {
      programs.niri.enable = true;

      xdg.portal = {
        enable = true;
        config = {
          niri.default = ["gnome" "gtk"];
        };
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
        ];
      };
    };

    homeManager = {pkgs, ...}: {
      imports = [
        inputs.niri.homeModules.niri
        inputs.niri.homeModules.stylix
      ];

      programs.niri = {
        enable = true;
        package = pkgs.niri;
        settings = {
          blur = {
            enable = true;
            passes = 2;
            offset = 12;
            saturation = 1.0125;
          };

          input = {
            keyboard = {
              xkb = {
                layout = host.keyboardLayout;
                options = "grp:win_space_toggle";
              };
              numlock = true;
            };

            mouse.accel-profile = "flat";
          };

          hotkey-overlay.skip-at-startup = true;
          screenshot-path = "~/pictures/screenshots/%Y-%m-%d %H-%M-%S.png";

          layout = {
            gaps = 6;

            preset-column-widths = [
              {proportion = 1. / 3.;}
              {proportion = 1. / 2.;}
              {proportion = 2. / 3.;}
            ];
            default-column-width = {proportion = 0.5;};

            focus-ring.enable = false;
            border = {
              enable = true;
              width = 2;
            };
          };

          spawn-at-startup = [
            # niri for some reason does not auto-start the polkit agent.
            {argv = ["${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"];}
            {argv = ["noctalia-shell"];}
            {argv = ["awww-daemon"];}
          ];
          prefer-no-csd = true;

          window-rules = [
            {
              geometry-corner-radius = let
                radius = 12.;
              in {
                bottom-left = radius;
                bottom-right = radius;
                top-left = radius;
                top-right = radius;
              };
              clip-to-geometry = true;
              background-effect.blur = true;
            }
            {
              matches = [
                {title = "Proton Pass";}
                {app-id = "io.ente.auth";}
                {app-id = "org.telegram.desktop";}
              ];
              block-out-from = "screencast";
            }
          ];

          layer-rules = [
            {
              matches = [
                {namespace = "^noctalia-overview";}
              ];
              place-within-backdrop = true;
            }
          ];

          outputs = lib.mapAttrs (_: monitor:
            with monitor; {
              mode = {inherit width height refresh;};
              position = {inherit x y;};
              focus-at-startup = lib.mkIf primary true;
            })
          host.displays;

          binds = {
            "Mod+Shift+Slash".action.show-hotkey-overlay = [];
            "Mod+Q" = {
              hotkey-overlay.title = "Open terminal";
              action.spawn = [host.terminal];
            };
            "Mod+R" = {
              hotkey-overlay.title = "Open launcher";
              action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
            };
            "Mod+E" = {
              hotkey-overlay.title = "Open file explorer";
              action.spawn = "nautilus";
            };
            "Mod+O" = {
              repeat = false;
              action.toggle-overview = [];
            };
            "Mod+C" = {
              repeat = false;
              action.close-window = [];
            };
            "Mod+Left".action.focus-column-left = [];
            "Mod+Down".action.focus-window-or-workspace-down = [];
            "Mod+Up".action.focus-window-or-workspace-up = [];
            "Mod+Right".action.focus-column-right = [];
            "Mod+H".action.focus-column-left = [];
            "Mod+J".action.focus-window-or-workspace-down = [];
            "Mod+K".action.focus-window-or-workspace-up = [];
            "Mod+L".action.focus-column-right = [];
            "Mod+Shift+Left".action.move-column-left = [];
            "Mod+Shift+Down".action.move-window-down-or-to-workspace-down = [];
            "Mod+Shift+Up".action.move-window-up-or-to-workspace-up = [];
            "Mod+Shift+Right".action.move-column-right = [];
            "Mod+Shift+H".action.move-column-left = [];
            "Mod+Shift+J".action.move-window-down-or-to-workspace-down = [];
            "Mod+Shift+K".action.move-window-up-or-to-workspace-up = [];
            "Mod+Shift+L".action.move-column-right = [];
            "Mod+Home".action.focus-column-first = [];
            "Mod+End".action.focus-column-last = [];
            "Mod+Shift+Home".action.move-column-to-first = [];
            "Mod+Shift+End".action.move-column-to-last = [];
            "Mod+D".action.focus-workspace-down = [];
            "Mod+U".action.focus-workspace-up = [];
            "Mod+Shift+D".action.move-column-to-workspace-down = [];
            "Mod+Shift+U".action.move-column-to-workspace-up = [];
            "Mod+WheelScrollDown" = {
              cooldown-ms = 100;
              action.focus-workspace-down = [];
            };
            "Mod+WheelScrollUp" = {
              cooldown-ms = 100;
              action.focus-workspace-up = [];
            };
            "Mod+Shift+WheelScrollDown".action.focus-column-right = [];
            "Mod+Shift+WheelScrollUp".action.focus-column-left = [];
            "XF86MonBrightnessUp" = {
              allow-when-locked = true;
              action.spawn = ["brightnessctl" "--class=backlight" "set" "+10%"];
            };
            "XF86MonBrightnessDown" = {
              allow-when-locked = true;
              action.spawn = ["brightnessctl" "--class=backlight" "set" "-10%"];
            };
            "Mod+BracketLeft".action.consume-or-expel-window-left = [];
            "Mod+BracketRight".action.consume-or-expel-window-right = [];
            "Mod+Comma".action.consume-window-into-column = [];
            "Mod+Period".action.expel-window-from-column = [];
            "Mod+Shift+R".action.switch-preset-column-width = [];
            "Mod+F".action.maximize-column = [];
            "F11".action.fullscreen-window = [];
            "Mod+Shift+F".action.expand-column-to-available-width = [];
            "Mod+Ctrl+C".action.center-column = [];
            "Mod+Shift+C".action.center-visible-columns = [];
            "Mod+Minus".action.set-column-width = ["-10%"];
            "Mod+Equal".action.set-column-width = ["+10%"];
            "Mod+Shift+Minus".action.set-window-height = ["-10%"];
            "Mod+Shift+Equal".action.set-window-height = ["+10%"];
            "Mod+V".action.toggle-window-floating = [];
            "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];
            "Mod+W".action.toggle-column-tabbed-display = [];
            "Print".action.screenshot = [];
            "Ctrl+Print".action.screenshot-screen = [];
            "Alt+Print".action.screenshot-window = [];
            "Mod+Escape" = {
              allow-inhibiting = false;
              action.toggle-keyboard-shortcuts-inhibit = [];
            };
            "Mod+M".action.quit.skip-confirmation = false;
            "Mod+Shift+M".action.quit.skip-confirmation = true;
            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;
            "Mod+Ctrl+1".action.move-column-to-workspace = 1;
            "Mod+Ctrl+2".action.move-column-to-workspace = 2;
            "Mod+Ctrl+3".action.move-column-to-workspace = 3;
            "Mod+Ctrl+4".action.move-column-to-workspace = 4;
            "Mod+Ctrl+5".action.move-column-to-workspace = 5;
            "Mod+Ctrl+6".action.move-column-to-workspace = 6;
            "Mod+Ctrl+7".action.move-column-to-workspace = 7;
            "Mod+Ctrl+8".action.move-column-to-workspace = 8;
            "Mod+Ctrl+9".action.move-column-to-workspace = 9;
          };
        };
      };

      # source: https://wiki.nixos.org/wiki/Polkit#Using_Home_Manager
      # niri for some reason does not auto-start the polkit agent.
      systemd.user.services.polkit-gnome-authentication-agent-1 = {
        Unit = {
          Description = "polkit-gnome-authentication-agent-1";
          Wants = ["graphical-session.target"];
          After = ["graphical-session.target"];
        };
        Install = {
          WantedBy = ["graphical-session.target"];
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
  };
}
