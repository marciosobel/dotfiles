{den, ...}: {
  den.hosts.x86_64-linux.desktop = {
    gitSigningKey = "00A753037271B008";
    keyboardLayout = "us,br";
    displays = {
      DP-3 = {
        refresh = 164.996;
        width = 1920;
        height = 1080;
        x = -1920;
        y = 600;
      };
      HDMI-A-1 = {
        primary = true;
        refresh = 99.965;
        width = 2560;
        height = 1440;
      };
    };
  };

  den.aspects.desktop = {
    includes = with den.aspects; [
      stylix
      nix
      xdg

      desktop-environments.niri.with-noctalia

      gaming

      development.git
      development.direnv
      development.zellij
      terminals.kitty
      shells.fish

      editors.nvim.with-plugins
      editors.helix
      editors.zed

      apps.browsers.zen-browser
      apps.davinci-resolve
      apps.vial
      apps.discord
      apps.obsidian
      apps.obs
      apps.fastfetch
      apps.cava
      apps.btop
      apps.yazi

      services.opentabletdriver
    ];
  };
}
