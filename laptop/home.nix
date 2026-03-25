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

  wayland.windowManager.hyprland.settings.monitor = ["eDP-1, 1920x1080@60, 0x0, 1"];
  programs.git.settings.user.signingKey = "E7F2E29E35A796E7";

  home.stateVersion = "25.11";
}
