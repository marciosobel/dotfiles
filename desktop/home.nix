{pkgs, ...}: {
  home.username = "marci";
  home.homeDirectory = "/home/marci";

  imports = [../modules/home-manager.nix];

  home.packages = with pkgs; [
    # essential apps and services
    adwaita-icon-theme # for GTK apps
    grimblast
    kitty
    playerctl

    # GUI
    krita
    dragon-drop
    mpv
    ente-auth
    heroic
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
    input.kb_layout = "us, br";
    monitor = [
      "HDMI-A-1, 2560x1440@100, 1920x-600, 1"
      "DP-3, 1920x1080@165, 0x0, 1"
    ];
  };

  programs.git.settings.user.signingKey = "00A753037271B008";

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

  home.stateVersion = "25.11";
}
