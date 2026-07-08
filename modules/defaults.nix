{__findFile, ...}: {
  den.default = {
    includes = [
      # https://den.denful.dev/reference/batteries/#denbatterieshost-aspects
      <den/host-aspects>
      <shards/apps/core>
    ];

    nixos = {
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      nixpkgs.config.allowUnfree = true;

      networking.hostName = "nixos";

      time.timeZone = "America/Recife";

      programs.gnupg.agent.enable = true;

      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "pt_BR.UTF-8";
        LC_IDENTIFICATION = "pt_BR.UTF-8";
        LC_MEASUREMENT = "pt_BR.UTF-8";
        LC_MONETARY = "pt_BR.UTF-8";
        LC_NAME = "pt_BR.UTF-8";
        LC_NUMERIC = "pt_BR.UTF-8";
        LC_PAPER = "pt_BR.UTF-8";
        LC_TELEPHONE = "pt_BR.UTF-8";
        LC_TIME = "pt_BR.UTF-8";
      };

      nix.settings.experimental-features = ["nix-command" "flakes"];

      system.stateVersion = "25.11"; # Did you read the comment?
    };

    homeManager = {
      home.stateVersion = "25.11"; # Please read the comment before changing.
    };
  };
}
