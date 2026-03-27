{pkgs, ...}: {
  home.username = "marci";
  home.homeDirectory = "/home/marci";

  imports = [../modules/home-manager.nix];

  home.packages = with pkgs; [
    # essential apps and services
    brightnessctl
    grimblast
    kitty
    adwaita-icon-theme # for GTK apps
    playerctl

    # GUI
    dragon-drop
    mpv
    ente-auth
    nautilus

    # TUI
    yazi
    lazygit

    # rust alternatives to unix commands
    lsd
    bat
    fzf
    ripgrep
  ];

  # Overrides
  wayland.windowManager.hyprland.settings = {
    input.kb_layout = "br";
    monitor = ["eDP-1, 1920x1080@60, 0x0, 1"];
  };

  programs.git.settings.user.signingKey = "E7F2E29E35A796E7";

  programs.waybar.settings.main = {
    modules-left = ["custom/icon" "hyprland/workspaces"];
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

  home.stateVersion = "25.11";
}
