{inputs, ...}: {
    # local = final: prev: {
    #     local = import ../pkgs {
    #         pkgs = final.pkgs;
    #         system = final.system;
    #     };
    # };
    #
    unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable {
            system = final.system;
        };
    };
}
