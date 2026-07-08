{den, ...}: {
  den.aspects.apps.roblox = {
    includes = [den.aspects.flatpak];

    nixos = {
      services.flatpak = {
        packages = ["org.vinegarhq.Sober"];
      };
    };
  };
}
