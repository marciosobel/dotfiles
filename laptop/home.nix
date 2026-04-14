{pkgs, ...}: {
  home.packages = with pkgs; [
    brightnessctl
  ];

  wayland.windowManager.hyprland.settings = {
    input.kb_layout = "br";
    monitor = ["eDP-1, 1920x1080@60, 0x0, 1"];
  };

  programs.git.settings.user.signingKey = "E7F2E29E35A796E7";

  programs.waybar.settings.main = {
    modules-left = [
      "custom/icon"
      "niri/workspaces"
    ];
    modules-center = ["clock"];
    modules-right = [
      "tray"
      "mpris"
      "privacy"
      "group/brightness"
      "network"
      "bluetooth"
      "battery"
    ];
  };

  programs.niri.settings.outputs."eDP-1".mode = {
    width = 1920;
    height = 1080;
    refresh = 60.0;
  };
}
