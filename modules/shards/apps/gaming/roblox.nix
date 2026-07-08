{shards, ...}: {
  shards.apps.gaming.roblox = {
    includes = [shards.flatpak];

    nixos = {
      services.flatpak = {
        packages = ["org.vinegarhq.Sober"];
      };
    };
  };
}
