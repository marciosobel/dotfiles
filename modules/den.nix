{
  inputs,
  den,
  ...
}: let
  namespace = inputs.den.namespace;
in {
  _module.args.__findFile = den.lib.__findFile;
  imports = [
    # https://den.denful.dev/tutorials/example/#namespaces
    (namespace "laptop" true)

    # https://den.denful.dev/guides/from-zero-to-den/#step-4-host-configuration-in-den
    inputs.den.flakeModule
  ];

  # https://den.denful.dev/tutorials/default/#nhnix--build-apps
  perSystem = {pkgs, ...}: {
    packages = den.lib.nh.denPackages {fromFlake = true;} pkgs;
  };
}
