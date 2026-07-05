{
  __findFile,
  den,
  ...
}: let
  user = "marci";
  cfg = {
    classes = [
      "homeManager"
      "user"
      "wheel"
      "networkmanager"
    ];
  };
in {
  den.aspects.${user} = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
      (<den/unfree> [
        "castlabs-electron" # for tidal-hifi
      ])
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

  den.hosts.x86_64-linux.laptop.users.${user} = cfg;
  den.hosts.x86_64-linux.desktop.users.${user} = cfg;
}
