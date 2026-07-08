{
  shards.apps.vial = {user, ...}: {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [vial];
      services.udev.packages = with pkgs; [vial];
      users.users.${user.name}.extraGroups = ["users"];
    };
  };
}
