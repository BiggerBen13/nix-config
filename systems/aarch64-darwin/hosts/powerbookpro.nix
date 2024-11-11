{
  inputs,
  lib,
  system,
  macosSystem,
  ...
} @ args: let
  name = "powerbookpro";

  modules = {
    darwin-modules = [
      ../../../modules/darwin
    ];
  };

  systemArgs = modules // args;
in {
  darwinConfigurations.${name} = macosSystem systemArgs;
}
