{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [pkgs.xwayland-satellite];

  imports = [
    ../awww.nix
    ./polkit.nix
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      binds = import ./binds.nix;

      blur = {
        enable = true;
        passes = 2;
        offset = 12;
        saturation = 1.0125;
      };

      input = {
        keyboard = {
          xkb.options = "grp:win_space_toggle";
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
    };
  };
}
