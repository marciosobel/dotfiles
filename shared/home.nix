{
  pkgs,
  user,
  ...
}: {
  home.username = user;
  home.homeDirectory = "/home/${user}";

  imports = [
    # desktop environment
    ../modules/hm/niri
    ../modules/hm/noctalia

    # other
    ../modules/hm/xdg.nix

    # apps
    ../modules/hm/git.nix
    ../modules/hm/zen-browser.nix
    ../modules/hm/nixcord.nix
    ../modules/hm/stylix.nix
    ../modules/hm/helix
    ../modules/hm/fish.nix
    ../modules/hm/obsidian.nix
    ../modules/hm/zed.nix
    ../modules/hm/zellij.nix
    ../modules/hm/fastfetch.nix
    ../modules/hm/direnv.nix
    ../modules/hm/kitty.nix
    ../modules/hm/btop.nix
    ../modules/hm/yazi.nix
    ../modules/hm/nvf.nix
  ];

  home.packages = with pkgs; [
    # essential apps and services
    grimblast
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
    telegram-desktop
    pinta

    # TUI
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
