{pkgs, ...}: {
  home.packages = with pkgs; [
    krita
    heroic
    handbrake
    prismlauncher
  ];

  programs.git.settings.user.signingKey = "00A753037271B008";

  wayland.windowManager.hyprland.settings = {
    input.kb_layout = "us, br";
    monitor = [
      "HDMI-A-1, 2560x1440@100, 1920x-600, 1"
      "DP-3, 1920x1080@165, 0x0, 1"
    ];
  };

  programs.waybar.settings.main = {
    modules-left = [
      "custom/icon"
      "hyprland/workspaces"
      "niri/workspaces"
    ];
    modules-center = ["clock"];
    modules-right = [
      "tray"
      "mpris"
      "hyprland/language"
      "niri/language"
      "privacy"
      "network"
    ];
  };

  programs.niri.settings = {
    input.keyboard.xkb.layout = "us,br";
    outputs = {
      "DP-3" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 164.996;
        };
        position = {
          x = -1920;
          y = 600;
        };
      };
      "HDMI-A-1" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 99.965;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
    };
  };
}
