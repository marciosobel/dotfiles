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
        spawn-at-startup = lib.mkAfter [
          {argv = ["noctalia-shell"];}
        ];
        binds = {
          "Mod+R" = {
            hotkey-overlay.title = "Open launcher";
            action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
          };
        };
      };
    };

    with-waybar = {
      includes = [
        <gems/wm/niri>
        <shards/services/dunst>
        <shards/apps/waybar>
        <shards/apps/wofi>
      ];

      homeManager.programs.niri.settings = {
        spawn-at-startup = lib.mkAfter [
          {argv = ["waybar"];}
        ];
        binds = {
          "Mod+R" = {
            hotkey-overlay.title = "Open launcher";
            action.spawn = ["wofi" "--show" "drun"];
          };
        };
      };
    };
  };
}
