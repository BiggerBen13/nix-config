{inputs, ...}: {
    # overlay for unstable packages
    unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable {
            system = final.system;
        };
    };
}
