{den, ...}: {
  den.hosts.x86_64-linux.laptop = {
    isLaptop = true;
    keyboardLayout = "br";
    displays = {
      eDP-1 = {
        primary = true;
        refresh = 60.001;
        width = 1920;
        height = 1080;
      };
    };
  };

  den.aspects.laptop = {
    includes = with den.aspects; [
      stylix
      nix
      xdg

      desktop-environments.niri.with-noctalia

      development.git
      development.direnv
      development.zellij
      terminals.kitty
      shells.fish

      editors.nvim.with-plugins

      apps.browsers.zen-browser
      apps.discord
      apps.obsidian
      apps.fastfetch
      apps.cava
      apps.btop
      apps.yazi

      services.auto-cpufreq
    ];

    nixos = {
      host,
      pkgs,
      ...
    }: {
      environment.systemPackages = with pkgs; [
        brightnessctl
      ];

      services.xserver.xkb.layout = host.keyboardLayout;
      console.useXkbConfig = true;

      networking.networkmanager.enable = true;

      hardware.bluetooth = {
        enable = true;
        settings.General.Experimental = true;
      };
    };
  };
}
