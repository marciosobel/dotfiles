{
  __findFile,
  shards,
  ...
}: {
  shards.apps.core = {
    includes = [(<den/unfree> ["unrar"])];

    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        helix
        neovim
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
        fd
      ];
    };

    gui = {
      includes = with shards; [apps.core];
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
