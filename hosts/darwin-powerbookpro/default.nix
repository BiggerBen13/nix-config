{inputs, system, overlays, ...}:
let 
    name = "powerbookpro";

    specialArgs = {
        inherit inputs overlays;
    };

    modules = [
        ./configuration.nix
        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
            nix-homebrew = {
                enable = true;
                # Apple Silicon Only
                enableRosetta = true;
                # User owning the homebrew prefix
                user = "biggerben";
                # autoMigrate = true;
            };
        }
    ];
in
 {
    darwinConfigurations.${name} = inputs.nix-darwin.lib.darwinSystem {
        inherit system specialArgs modules;
    };

 }
