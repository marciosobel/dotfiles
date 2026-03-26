{
  programs.waybar = {
    enable = true;
    settings = {
      main = {
        # settings
        position = "top";
        height = 30;
        fixed-center = true;
        spacing = 10;

        # modules
        "custom/icon".format = "";
        tray.spacing = 10;
        privacy = {
          icon-size = 14;
          modules = [{type = "screenshare";}];
        };
        "hyprland/language" = {
          format-pt = "br";
          format-en = "en";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "■";
            default = "□";
          };
        };
        battery = {
          interval = 60;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}%  {icon}";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          max-length = 25;
        };
        network = {
          format = "";
          format-disconnected = "";
        };
        clock = {
          format = "{:%A %H:%M}";
          format-alt = "{:%H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode-mon-col = 3;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        bluetooth = {
          format = "{status} 󰂯";
          format-connected = "{device_alias} 󰂱";
          format-on = "󰂯";
          format-off = "󰂲";
          format-disabled = "󰂲";
        };
        "custom/sun" = {
          format = "";
          tooltip = false;
        };
        "group/brightness" = {
          "orientation" = "inherit";
          modules = ["custom/sun" "backlight/slider"];
          drawer.transition-left-to-right = false;
        };
      };
    };

    style = ''
      * {
        font-family: Nunito, 'JetBrainsMono Nerd Font Propo';
      }

      window#waybar {
        background-color: @base00;
        color: @base05;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        margin-top: 0px;
      }

      .modules-left {
        padding-left: 10px;
      }

      .modules-right {
        padding-right: 10px;
      }

      #workspaces {
        margin-left: 5px;
      }

      #workspaces button {
        all: unset;
        padding: 0px 5px;
        margin-bottom: 2px;
        font-size: 12px;
        transition: all .1s ease;
        opacity: 0.5;
      }

      #workspaces button.active {
        opacity: 1;
      }

      #backlight-slider slider {
        min-height: 0;
        min-width: 0;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
        background: none;
      }

      #backlight-slider trough {
        min-height: 10px;
        min-width: 80px;
        background: @base01;
        border: 0;
        border-radius: 0;
      }

      #backlight-slider highlight {
        min-height: 10px;
        min-width: 10px;
        border-radius: 0;
        background: @base05;
        border: 0;
      }

      #battery .charging {
        color: @base0B;
      }

      #tray * {
        border-radius: 0;
      }
    '';
  };
}
