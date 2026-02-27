{ pkgs, ... }: {
  home.username = "marci";
  home.homeDirectory = "/home/marci";

  imports = [ ../shared/home-manager.nix ];

  home.packages = with pkgs; [
    kitty
    fastfetch
  ];

  wayland.windowManager.hyprland.settings.monitor = [ "eDP-1, 1920x1080@60, 0x0, 1" ];
  programs.git.settings.user.signingKey = "E7F2E29E35A796E7";

  programs.wofi.enable = true;

  home.stateVersion = "25.11";
}
