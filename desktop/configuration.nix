{user, ...}: {
  imports = [../modules/nixos/vial.nix];

  services.xserver.xkb.layout = "us"; # Configure keymap in X11
  users.users.${user}.extraGroups = ["users"];
}
