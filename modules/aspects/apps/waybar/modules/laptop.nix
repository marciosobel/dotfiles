{
  den.aspects.apps.waybar.modules.laptop = {
    homeManager = {
      programs.waybar.settings.main = {
        modules-right = [
          "tray"
          "mpris"
          "privacy"
          "group/brightness"
          "network"
          "bluetooth"
          "battery"
        ];
      };
    };
  };
}
