{
  den.aspects.apps.waybar.modules.desktop = {
    homeManager = {
      programs.waybar.settings.main = {
        modules-right = [
          "tray"
          "mpris"
          "hyprland/language"
          "niri/language"
          "privacy"
          "network"
        ];
      };
    };
  };
}
