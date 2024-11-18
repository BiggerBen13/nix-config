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
      ../../../secrets/darwin.nix
      ../../../hosts/darwin-${name}
    ];
    home-modules = [
      ../../../home/darwin
      ../../../hosts/darwin-${name}/home.nix
    ];
  };

  systemArgs = modules // args;
in {
  darwinConfigurations.${name} = macosSystem systemArgs;
}
