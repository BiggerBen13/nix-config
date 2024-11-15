{
  inputs,
  lib,
  system,
  macosSystem,
  myvars,
  ...
} @ args: let
  name = "powerbookpro";

  modules = {
    darwin-modules = [
      ../../../modules/darwin
    ];
    home-modules = [
      ../../../home/darwin
      # ../../../hosts/darwin-${name}/home.nix
    ];
  };

  systemArgs = modules // args;
in {
  darwinConfigurations.${name} = macosSystem systemArgs;
}
