{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      # SWAP priority. Highest than 60 (default) is good for zram:
      # https://lists.ubuntu.com/archives/lubuntu-users/2013-October/005831.html
      "vm.swappiness=90"
    ];
  };
}
