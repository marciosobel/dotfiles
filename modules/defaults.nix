{den, ...}: {
  den.default = {
    includes = [
      # including the `host-aspects` batteries will
      # forward any `homeManager` key from the host
      # to the user.
      # https://den.denful.dev/reference/batteries/#denbatterieshost-aspects
      den.batteries.host-aspects
    ];

    homeManager = {
      home.stateVersion = "25.11";
    };

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

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?
    };
  };
}
