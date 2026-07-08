{
  shards.apps.gaming.gamemode = {
    nixos = {user}: {
      programs.gamemode.enable = true;
      users.users.${user.name}.extraGroups = ["gamemode"];
    };
  };
}
