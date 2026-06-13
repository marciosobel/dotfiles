{
  inputs,
  config,
  ...
}: let
  radius = 12;
in {
  imports = [inputs.noctalia.homeModules.default];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = import ./bar.nix {inherit radius;};

      ui = {
        scrollbarAlwaysVisible = false;
      };

      general = {
        telemetryEnabled = false;

        avatarImage = "${config.home.homeDirectory}/.face";
        dimmerOpacity = 0;
        enableShadows = false;
        showScreenCorners = true;
        forceBlackScreenCorners = true;
        scaleRatio = 1;
        radiusRatio = radius / 10;
        iRadiusRatio = radius / 10;
        animationSpeed = 2;
        enableBlurBehind = false;

        lockScreenAnimations = true;
        enableLockScreenMediaControls = true;
        clockStyle = "digital";
        passwordChars = true; # use random password icons
        lockScreenTint = 0.5;
        showHibernateOnLockScreen = false;
        lockScreenCountdownDuration = 5000;
      };

      location = {
        autoLocate = true;
        showWeekNumberInCalendar = false;
        useFahrenheit = false;
      };

      calendar.cards =
        builtins.map (id: {
          inherit id;
          enabled = true;
        })
        ["calendar-header-card" "calendar-month-card" "weather-card"];

      wallpaper = {
        enabled = false;
        overviewEnabled = true;
        directory = "${config.xdg.userDirs.pictures}/wallpapers";
      };

      appLauncher = {
        terminalCommand = "ghostty -e";
        viewMode = "list";
        iconMode = "native";
        showCategories = false;
        enableWindowsSearch = false;
        enableSettingsSearch = false;
      };

      controlCenter = {
        shortcuts = {
          left = [
            {id = "Network";}
            {id = "Bluetooth";}
            {id = "NoctaliaPerformance";}
          ];
          right = [
            {id = "PowerProfile";}
            {id = "KeepAwake";}
            {id = "NightLight";}
          ];
        };
        cards = [
          {
            id = "profile-card";
            enabled = true;
          }
          {
            id = "shortcuts-card";
            enabled = true;
          }
          {
            id = "audio-card";
            enabled = true;
          }
          {
            id = "brightness-card";
            enabled = false;
          }
          {
            id = "weather-card";
            enabled = true;
          }
        ];
      };

      dock = {
        enabled = false;
      };

      sessionMenu = {
        countdownDuration = 5000;
        largeButtonsStyle = false;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
            keybind = "1";
            countdownEnabled = false;
          }
          {
            action = "suspend";
            enabled = true;
            keybind = "2";
            countdownEnabled = false;
          }
          {
            action = "logout";
            enabled = true;
            keybind = "3";
            countdownEnabled = true;
          }
          {
            action = "hibernate";
            enabled = false;
          }
          {
            action = "reboot";
            enabled = true;
            keybind = "4";
            countdownEnabled = true;
          }
          {
            action = "rebootToUefi";
            enabled = true;
            keybind = "5";
            countdownEnabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
            keybind = "6";
            countdownEnabled = true;
          }
          {
            action = "userspaceReboot";
            enabled = false;
          }
        ];
      };

      notifications = {
        location = "bottom_right";
        overlayLayer = false;
      };

      nightLight = {
        autoSchedule = true;
        nightTemp = "5000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };

      osd = {
        location = "top";
        overlayLayer = false;
        enabledTypes = [0 1 2 3];
        autoHideMs = 1000;
      };

      audio = {
        volumeOverdrive = true;
      };

      idle = {
        enabled = true;
      };

      colorSchemes = {
        darkMode = config.stylix.polarity == "dark";
      };
    };
  };
}
