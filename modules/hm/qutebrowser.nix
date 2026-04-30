{lib, ...}: {
  programs.qutebrowser = {
    enable = true;
    settings = {
      tabs = {
        position = "right";
        width = 200;
      };
      scrolling.smooth = true;
    };
    keyBindings = {
      normal = {
        "<f1>" = lib.mkMerge [
          "config-cycle tabs.show never always"
          "config-cycle statusbar.show in-mode always"
          "config-cycle scrolling.bar never always"
        ];
      };
    };
  };
}
