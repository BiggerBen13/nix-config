{
  lib,
  inputs,
  darwin-modules,
  system,
  genSpecialArgs,
  specialArgs ? (genSpecialArgs system),
  ...
}: let
  inherit (inputs) nixpkgs-darwin home-manager nix-darwin;
in
  nix-darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules =
      darwin-modules
      ++ [
        ({lib, ...}: {
          nixpkgs.pkgs = import nixpkgs-darwin {inherit system;};
        })
      ];
  }
