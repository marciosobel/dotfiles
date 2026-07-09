{inputs, ...}: {
  shards.apps.noctalia = {
    homeManager = {
      host,
      config,
      ...
    }: let
      primaryMonitor = builtins.head (
        builtins.filter
        (name: host.displays.${name}.primary or false)
        (builtins.attrNames host.displays)
      );
    in {
      imports = [inputs.noctalia.homeModules.default];

      programs.noctalia = {
        enable = true;

        settings = {
          audio.enable_overdrive = true;

          bar = {
            order = ["main"];

            main = {
              enabled = true;
              start = ["control-center" "workspaces"];
              center = ["clock"];
              end = [
                "media"
                "tray"
                "notifications"
                "clipboard"
                "network"
                "bluetooth"
                "volume"
                "brightness"
                "battery"
                "session"
              ];
              margin_ends = 0;
              padding = 10;
              position = "right";
              widget_spacing = 12;
            };
          };

          location.auto_locate = true;

          lockscreen.blurred_desktop = true;
          #
          # lockscreen_widgets = {
          #   enabled = true;
          #   schema_version = 2;
          #   widget_order = [
          #     "lockscreen-login-box@DP-3"
          #     "lockscreen-login-box@HDMI-A-1"
          #     "lockscreen-widget-0000000000000001"
          #     "lockscreen-widget-0000000000000002"
          #     "lockscreen-widget-0000000000000003"
          #     "lockscreen-widget-0000000000000004"
          #   ];
          #
          #   grid = {
          #     cell_size = 16;
          #     major_interval = 4;
          #     visible = true;
          #   };
          #
          #   widget = {
          #     "lockscreen-login-box@DP-3" = {
          #       box_height = 70.0;
          #       box_width = 400.0;
          #       cx = 960.0;
          #       cy = 957.0;
          #       output = "DP-3";
          #       rotation = 0.0;
          #       type = "login_box";
          #       settings = {
          #         background_color = "surface_variant";
          #         background_opacity = 0.88;
          #         background_radius = 12.0;
          #         input_opacity = 1.0;
          #         input_radius = 6.0;
          #         show_caps_lock = true;
          #         show_keyboard_layout = true;
          #         show_login_button = true;
          #         show_password_hint = true;
          #       };
          #     };
          #
          #     "lockscreen-login-box@HDMI-A-1" = {
          #       box_height = 70.0;
          #       box_width = 400.0;
          #       cx = 1280.0;
          #       cy = 1317.0;
          #       output = "HDMI-A-1";
          #       rotation = 0.0;
          #       type = "login_box";
          #       settings = {
          #         background_color = "surface_variant";
          #         background_opacity = 0.88;
          #         background_radius = 12.0;
          #         input_opacity = 1.0;
          #         input_radius = 6.0;
          #         show_caps_lock = true;
          #         show_keyboard_layout = true;
          #         show_login_button = true;
          #         show_password_hint = true;
          #       };
          #     };
          #
          #     lockscreen-widget-0000000000000001 = {
          #       box_height = 128.0;
          #       box_width = 224.0;
          #       cx = 1280.0;
          #       cy = 684.0;
          #       output = "HDMI-A-1";
          #       rotation = 0.0;
          #       type = "clock";
          #       settings = {
          #         background = false;
          #         center_text = false;
          #         shadow = false;
          #       };
          #     };
          #
          #     lockscreen-widget-0000000000000002 = {
          #       box_height = 0.0;
          #       box_width = 0.0;
          #       cx = 1280.0;
          #       cy = 1196.0;
          #       output = "HDMI-A-1";
          #       rotation = 0.0;
          #       type = "media_player";
          #       settings = {
          #         background = false;
          #         hide_when_no_media = true;
          #         shadow = false;
          #       };
          #     };
          #
          #     lockscreen-widget-0000000000000003 = {
          #       box_height = 0.0;
          #       box_width = 0.0;
          #       cx = 1280.0;
          #       cy = 735.5;
          #       output = "HDMI-A-1";
          #       rotation = 0.0;
          #       type = "label";
          #       settings = {
          #         background = false;
          #         description = "";
          #         shadow = false;
          #         title = "see you later!";
          #       };
          #     };
          #
          #     lockscreen-widget-0000000000000004 = {
          #       box_height = 96.0;
          #       box_width = 240.0;
          #       cx = 1280.0;
          #       cy = 592.0;
          #       output = "HDMI-A-1";
          #       rotation = 0.0;
          #       type = "audio_visualizer";
          #       settings = {
          #         background = false;
          #         bands = 32;
          #         centered = false;
          #         color_2 = "primary";
          #         mirrored = true;
          #         show_when_idle = false;
          #       };
          #     };
          #   };
          # };

          nightlight = {
            enabled = true;
            temperature_night = 5000;
          };

          notification = {
            background_opacity = 1.0;
            monitors = [primaryMonitor];
            position = "bottom_right";
          };

          osd = {
            background_opacity = 1.0;
            monitors = [primaryMonitor];
            position = "bottom_center";
          };

          shell = {
            app_icon_color = "on_surface_variant";
            avatar_path = "${config.home.homeDirectory}/.face";
            clipboard_image_action_command = "pinta {path}";
            niri_overview_type_to_launch_enabled = true;
            password_style = "random";
            polkit_agent = true;

            animation.speed = 1.25;

            launcher.categories = false;

            panel = {
              borders = false;
              open_near_click_clipboard = true;
              open_near_click_control_center = true;
              open_near_click_session = true;
              session_position = "center";
            };

            screen_corners = {
              enabled = true;
              size = 12;
            };

            session.actions = [
              {
                action = "lock";
                countdown_seconds = 0.0;
                enabled = true;
                variant = "default";
              }
              {
                action = "logout";
                countdown_seconds = 0.0;
                enabled = true;
                variant = "default";
              }
              {
                action = "lock_and_suspend";
                countdown_seconds = 0.0;
                enabled = false;
                variant = "default";
              }
              {
                action = "reboot";
                countdown_seconds = 0.0;
                enabled = true;
                variant = "default";
              }
              {
                action = "shutdown";
                countdown_seconds = 0.0;
                enabled = true;
                variant = "destructive";
              }
            ];

            shadow = {
              alpha = 0.3;
              direction = "center";
            };
          };

          wallpaper.transition = ["disc" "honeycomb" "stripes"];

          widget = {
            "control-center" = {
              enabled = true;
              glyph = "heart";
            };

            workspaces = {
              display = "none";
              empty_color = "outline";
              enabled = true;
            };

            launcher.enabled = true;
            media.enabled = true;
            session.enabled = true;
            tray.enabled = true;

            volume.show_label = false;
            brightness.show_label = false;
          };
        };
        # settings = {
        #   bar.main = {
        #     enabled = true;
        #     margin_ends = 0;
        #     position = "right";
        #     padding = 10;
        #     widget_spacing = 12;
        #     start = [
        #       "control-center"
        #       "workspaces"
        #     ];
        #     center = "clock";
        #     end = [
        #       "media"
        #       "tray"
        #       "notifications"
        #       "clipboard"
        #       "network"
        #       "bluetooth"
        #       "volume"
        #       "brightness"
        #       "battery"
        #       "session"
        #     ];
        #   };
        # };
      };

      #   programs.noctalia = {
      #     enable = true;
      #     settings = {
      #       bar = {
      #         position = "right";
      #         density = "default";
      #         barType = "simple";
      #         showCapsule = false;
      #         fontScale = 1.1;
      #         widgetSpacing = 4;
      #         contentPadding = 0;
      #         enableExclusionZoneInset = true;
      #         useSeparateOpacity = false;
      #         marginVertical = 0;
      #         marginHorizontal = 0;
      #         frameThickness = 0;
      #         frameRadius = radius;
      #         outerCorners = true;
      #         widgets = {
      #           left = [
      #             {
      #               id = "ControlCenter";
      #               enableColorization = true;
      #               icon = "heart";
      #             }
      #             {
      #               id = "Workspace";
      #               pillSize = 0.5;
      #               focusedColor = "none";
      #               occupiedColor = "primary";
      #               emptyColor = "primary";
      #             }
      #           ];
      #           center = [
      #             {
      #               id = "Clock";
      #               formatHorizontal = "HH:mm";
      #               formatVertical = "HH mm";
      #               tooltipFormat = "HH:mm ddd, MMM dd";
      #             }
      #           ];
      #           right = [
      #             {id = "MediaMini";}
      #             {
      #               id = "Tray";
      #               chevronColor = "none";
      #               colorizeIcons = true;
      #               drawerEnabled = false;
      #             }
      #             {
      #               id = "NotificationHistory";
      #               unreadBadgeColor = "error";
      #             }
      #             {id = "Bluetooth";}
      #             {id = "Battery";}
      #             {id = "Brightness";}
      #             {id = "Volume";}
      #             {id = "Network";}
      #           ];
      #         };
      #
      #         ui = {
      #           scrollbarAlwaysVisible = false;
      #         };
      #
      #         general = {
      #           telemetryEnabled = false;
      #
      #           avatarImage = "${config.home.homeDirectory}/.face";
      #           dimmerOpacity = 0;
      #           enableShadows = false;
      #           showScreenCorners = true;
      #           forceBlackScreenCorners = true;
      #           scaleRatio = 1;
      #           radiusRatio = radius / 10;
      #           iRadiusRatio = radius / 10;
      #           animationSpeed = 2;
      #           enableBlurBehind = false;
      #
      #           lockScreenAnimations = true;
      #           enableLockScreenMediaControls = true;
      #           clockStyle = "digital";
      #           passwordChars = true; # use random password icons
      #           lockScreenTint = 0.5;
      #           showHibernateOnLockScreen = false;
      #           lockScreenCountdownDuration = 5000;
      #         };
      #
      #         location = {
      #           autoLocate = true;
      #           showWeekNumberInCalendar = false;
      #           useFahrenheit = false;
      #         };
      #
      #         calendar.cards =
      #           builtins.map (id: {
      #             inherit id;
      #             enabled = true;
      #           })
      #           ["calendar-header-card" "calendar-month-card" "weather-card"];
      #
      #         wallpaper = {
      #           enabled = false;
      #           overviewEnabled = true;
      #           directory = "${config.xdg.userDirs.pictures}/wallpapers";
      #         };
      #
      #         appLauncher = {
      #           terminalCommand = "ghostty -e";
      #           viewMode = "list";
      #           iconMode = "native";
      #           showCategories = false;
      #           enableWindowsSearch = false;
      #           enableSettingsSearch = false;
      #         };
      #
      #         controlCenter = {
      #           shortcuts = {
      #             left = [
      #               {id = "Network";}
      #               {id = "Bluetooth";}
      #               {id = "NoctaliaPerformance";}
      #             ];
      #             right = [
      #               {id = "PowerProfile";}
      #               {id = "KeepAwake";}
      #               {id = "NightLight";}
      #             ];
      #           };
      #           cards = [
      #             {
      #               id = "profile-card";
      #               enabled = true;
      #             }
      #             {
      #               id = "shortcuts-card";
      #               enabled = true;
      #             }
      #             {
      #               id = "audio-card";
      #               enabled = true;
      #             }
      #             {
      #               id = "brightness-card";
      #               enabled = false;
      #             }
      #             {
      #               id = "weather-card";
      #               enabled = true;
      #             }
      #           ];
      #         };
      #
      #         dock = {
      #           enabled = false;
      #         };
      #
      #         sessionMenu = {
      #           countdownDuration = 5000;
      #           largeButtonsStyle = false;
      #           powerOptions = [
      #             {
      #               action = "lock";
      #               enabled = true;
      #               keybind = "1";
      #               countdownEnabled = false;
      #             }
      #             {
      #               action = "suspend";
      #               enabled = true;
      #               keybind = "2";
      #               countdownEnabled = false;
      #             }
      #             {
      #               action = "logout";
      #               enabled = true;
      #               keybind = "3";
      #               countdownEnabled = true;
      #             }
      #             {
      #               action = "hibernate";
      #               enabled = false;
      #             }
      #             {
      #               action = "reboot";
      #               enabled = true;
      #               keybind = "4";
      #               countdownEnabled = true;
      #             }
      #             {
      #               action = "rebootToUefi";
      #               enabled = true;
      #               keybind = "5";
      #               countdownEnabled = true;
      #             }
      #             {
      #               action = "shutdown";
      #               enabled = true;
      #               keybind = "6";
      #               countdownEnabled = true;
      #             }
      #             {
      #               action = "userspaceReboot";
      #               enabled = false;
      #             }
      #           ];
      #         };
      #
      #         notifications = {
      #           location = "bottom_right";
      #           overlayLayer = false;
      #         };
      #
      #         nightLight = {
      #           autoSchedule = true;
      #           nightTemp = "5000";
      #           dayTemp = "6500";
      #           manualSunrise = "06:30";
      #           manualSunset = "18:30";
      #         };
      #
      #         osd = {
      #           location = "top";
      #           overlayLayer = false;
      #           enabledTypes = [0 1 2 3];
      #           autoHideMs = 1000;
      #         };
      #
      #         audio = {
      #           volumeOverdrive = true;
      #         };
      #
      #         idle = {
      #           enabled = true;
      #         };
      #
      #         # colorSchemes = {
      #         #   darkMode = config.stylix.polarity == "dark";
      #         # };
      #       };
      #     };
      #   };
    };
  };
}
