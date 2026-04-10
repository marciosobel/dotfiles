{
  imports = [../modules/nixos/auto-cpufreq.nix];

  services.xserver.xkb.layout = "br"; # Configure keymap in X11

  console.keyMap = "br-abnt2"; # Configure console keymap

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };
}
