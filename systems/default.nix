{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  myvars = import ../vars {inherit lib;};

  genSpecialArgs = system:
    inputs
    // {
      inherit myvars;

      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        inherit system;
      };
    };

  args = {inherit inputs lib myvars genSpecialArgs;};

  darwinSystems = {
    aarch64-darwin = import ./aarch64-darwin (args // {system = "aarch64-darwin";});
  };
  darwinSystemValues = builtins.attrValues darwinSystems;

  nixosSystems = {};
  nixosSystemValues = builtins.attrValues nixosSystems;

  allSystems = darwinSystems // nixosSystems;
  allSystemNames = builtins.attrNames allSystems;

  forAllSystems = func: (nixpkgs.lib.genAttrs allSystemNames func);
in {
  darwinConfigurations = lib.attrsets.mergeAttrsList (map (it: it.darwinConfigurations or {}) darwinSystemValues);

  formatter = forAllSystems (
    system: nixpkgs.legacyPackages.${system}.alejandra
  );
}
