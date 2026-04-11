{
  pkgs,
  user,
  ...
}: {
  environment.systemPackages = with pkgs; [vial];
  services.udev.packages = with pkgs; [vial];
  users.users.${user}.extraGroups = ["users"];
}
