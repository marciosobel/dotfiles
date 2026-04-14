{pkgs, ...}: {
  home.packages = [pkgs.xwayland-satellite];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = "us,br";
            options = "grp:win_space_toggle";
          };
          numlock = true;
        };

        mouse.accel-profile = "flat";
      };

      screenshot-path = "~/pictures/screenshots/%Y-%m-%d %H-%M-%S.png";

      layout = {
        gaps = 6;

        preset-column-widths = [
          {proportion = 1. / 3.;}
          {proportion = 1. / 2.;}
          {proportion = 2. / 3.;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 1.0;};

        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
        };
      };

      spawn-at-startup = [
        {argv = ["waybar"];}
        {argv = ["swww-daemon"];}
        {argv = ["${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"];}
      ];
      prefer-no-csd = true;

      binds = import ./binds.nix;
    };
  };
}
