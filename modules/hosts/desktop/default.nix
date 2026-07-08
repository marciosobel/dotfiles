{__findFile, ...}: {
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
    includes = [
      <gems/wm/niri/with-noctalia>
      <gems/gaming/full>
      <gems/development>
      <gems/optimisations>

      <shards/apps/davinci-resolve>
      <shards/apps/obs>
      <shards/services/opentabletdriver>
    ];
  };
}
