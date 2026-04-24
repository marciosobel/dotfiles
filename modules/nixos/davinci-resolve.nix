{pkgs, ...}: {
  environment.systemPackages = with pkgs; [davinci-resolve];
  environment.variables.RUSTICL_ENABLE = "radeonsi";
  hardware.amdgpu.opencl.enable = true;
}
