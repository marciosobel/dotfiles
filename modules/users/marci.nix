{
  __findFile,
  den,
  ...
}: let
  cfg = {
    classes = [
      "homeManager"
      "user"
      "wheel"
      "networkmanager"
    ];
  };
in {
  den.aspects.marci = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
      (<den/unfree> ["castlabs-electron"])
      den.aspects.apps.core.gui
    ];

    homeManager = {pkgs, ...}: {
      home.packages = with pkgs; [
        ente-auth
        nautilus
        tidal-hifi
        proton-pass
        telegram-desktop
        lazygit
      ];
    };
  };

  den.hosts.x86_64-linux.laptop.users.marci = cfg;
}
