{den, ...}: {
  den.aspects.gaming = {
    nixos = {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        gamescopeSession.enable = true;
      };
    };

    max = {
      includes = with den.aspects; [gaming];
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          mangohud
          prismlauncher
          heroic
        ];
        programs.gamemode.enable = true;
      };
    };

    min = {
      includes = with den.aspects; [gaming];
    };
  };
}
