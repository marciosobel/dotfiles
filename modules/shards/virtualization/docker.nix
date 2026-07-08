{
  shards.virtualisation.docker = {user, ...}: {
    nixos = {
      virtualisation.docker.enable = true;
      users.users.${user.name}.extraGroups = ["docker"];
    };
  };
}
