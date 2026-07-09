{
  __findFile,
  lib,
  ...
}: {
  gems.wm.niri = {
    includes = [
      <shards/window-managers/niri>
      <shards/apps/core/gui>
      <shards/xdg>
      <shards/stylix>
    ];

    with-noctalia = {
      includes = [
        <gems/wm/niri>
        <shards/apps/noctalia>
      ];

      homeManager.programs.niri.settings = {
        spawn-at-startup = lib.mkAfter [{argv = ["noctalia"];}];
        binds = {
          "Mod+R" = {
            hotkey-overlay.title = "Open launcher";
            action.spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
          };
        };
      };
    };

    with-waybar = {
      includes = [
        <gems/wm/niri>
        <shards/apps/waybar>
        <shards/apps/wofi>
        <shards/services/awww>
        <shards/services/dunst>
      ];

      homeManager = {pkgs, ...}: {
        programs.niri.settings = {
          spawn-at-startup = lib.mkAfter [
            {argv = ["waybar"];}
            # niri for some reason does not auto-start the polkit agent.
            {argv = ["${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"];}
            {argv = ["awww-daemon"];}
          ];
          binds = {
            "Mod+R" = {
              hotkey-overlay.title = "Open launcher";
              action.spawn = ["wofi" "--show" "drun"];
            };
          };
        };

        # source: https://wiki.nixos.org/wiki/Polkit#Using_Home_Manager
        # niri for some reason does not auto-start the polkit agent.
        systemd.user.services.polkit-gnome-authentication-agent-1 = {
          Unit = {
            Description = "polkit-gnome-authentication-agent-1";
            Wants = ["graphical-session.target"];
            After = ["graphical-session.target"];
          };
          Install = {
            WantedBy = ["graphical-session.target"];
          };
          Service = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
        };
      };
    };
  };
}
