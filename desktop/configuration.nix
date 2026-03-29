{
  pkgs,
  user,
  ...
}: {
  imports = [./hardware-configuration.nix];
  services.xserver.xkb.layout = "us"; # Configure keymap in X11

  environment.systemPackages = with pkgs; [vial];
  services.udev.packages = with pkgs; [vial];
  users.users.${user}.extraGroups = ["users"];
}
