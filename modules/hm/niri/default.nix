{pkgs, ...}: {
  home.packages = [pkgs.xwayland-satellite];

  imports = [./polkit.nix];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        keyboard = {
          xkb.options = "grp:win_space_toggle";
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
        ];
        default-column-width = {proportion = 0.5;};

        focus-ring.enable = false;
        border = {
          enable = true;
          width = 1;
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
