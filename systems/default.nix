{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;

  genSpecialArgs = system:
    inputs
    // {
      pkgs-unstable = import inputs.nixpkgs-unsable {
        inherit system;
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
      };
    };

  args = {inherit inputs lib genSpecialArgs;};

  darwinSystems = {
    aarch64-darwin = import ./aarch64-darwin (args // {system = "aarch64-darwin";});
  };
  darwinSystemValues = builtins.attrValues darwinSystems;

  nixosSystems = {};
  nixosSystemVales = builtins.attrValues nixosSystems;

  allSystems = darwinSystems // nixosSystems;
  allSystemNames = builtins.attrNames allSystems;

  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  darwinConfigurations = lib.attrsets.mergeAttrsList (map (it: it.darwinConfigurations or {}) darwinSystemValues);

  formatter = forAllSystems (
    system: nixpkgs.legacyPackages.${system}.alejandra
  );
}
