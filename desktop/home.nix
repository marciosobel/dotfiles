{pkgs, ...}: {
  home.packages = with pkgs; [
    krita
    heroic
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
    modules-left = ["custom/icon" "hyprland/workspaces"];
    modules-center = ["clock"];
    modules-right = [
      "tray"
      "mpris"
      "hyprland/language"
      "privacy"
      "network"
    ];
  };
}
