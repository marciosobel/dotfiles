{
  pkgs,
  user,
  ...
}: {
  home.username = user;
  home.homeDirectory = "/home/${user}";

  imports = [
    # ../modules/hm/hyprland.nix
    ../modules/hm/niri
    ../modules/hm/git.nix
    ../modules/hm/zen-browser.nix
    ../modules/hm/nixcord.nix
    ../modules/hm/awww.nix
    ../modules/hm/waybar.nix
    ../modules/hm/stylix.nix
    ../modules/hm/helix
    ../modules/hm/fish.nix
    ../modules/hm/obsidian.nix
    ../modules/hm/zed.nix
    ../modules/hm/zellij.nix
    ../modules/hm/wofi.nix
    ../modules/hm/fastfetch.nix
    ../modules/hm/dunst.nix
    ../modules/hm/direnv.nix
    ../modules/hm/ghostty.nix
    ../modules/hm/btop.nix
    ../modules/hm/xdg.nix
  ];

  home.packages = with pkgs; [
    # essential apps and services
    grimblast
    kitty
    playerctl
    unzip
    unrar

    # GUI
    dragon-drop
    mpv
    ente-auth
    nautilus
    tidal-hifi
    zathura
    proton-pass

    # TUI
    yazi
    lazygit
    pass

    # rust alternatives to unix commands
    lsd
    bat
    fzf
    ripgrep
  ];

  home.stateVersion = "25.11";
}
