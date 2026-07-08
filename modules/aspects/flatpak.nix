{inputs, ...}: {
  den.aspects.flatpak = {
    nixos = {
      imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];
      services.flatpak = {
        enable = true;
        uninstallUnmanaged = true;
      };
    };
  };
}
