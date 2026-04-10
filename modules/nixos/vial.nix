{pkgs, ...}: {
  environment.systemPackages = with pkgs; [vial];
  services.udev.packages = with pkgs; [vial];
}
