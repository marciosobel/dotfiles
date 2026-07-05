{
  __findFile,
  den,
  ...
}: {
  den.aspects.apps.core = {
    includes = [
      (<den/unfree> ["unrar"])
    ];

    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        helix
        neovim
        git
      ];
    };

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        playerctl
        unzip
        unrar
        pass
        lsd
        bat
        fzf
        ripgrep
      ];
    };

    gui = {
      includes = with den.aspects; [apps.core];
      homeManager = {pkgs, ...}: {
        home.packages = with pkgs; [
          dragon-drop
          mpv
          nautilus
          pinta
        ];
      };
    };
  };
}
