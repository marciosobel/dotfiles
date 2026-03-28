{
  imports = [./hardware-configuration.nix];
  services.xserver.xkb.layout = "us"; # Configure keymap in X11
}
