{
    description = "BiggerBens Darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOs/nixpkgs/nixpkgs-24.05-darwin";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    };

    outputs = { self, nix-darwin, nixpkgs, nixpkgs-unstable, nix-homebrew, ... } @ inputs : let
        inherit (inputs.nixpkgs) lib;
        overlays = import ./overlays {inherit inputs;};
        # inherit (self) outputs;
        args = {inherit inputs lib overlays;};

        darwin_hosts = {
            darwin-powerbookpro = import ./hosts/darwin-powerbookpro (args // {system = "aarch64-darwin";});
        };

        darwin_host_values = builtins.attrValues darwin_hosts;

    in
        {
        nixpkgs.overlays = [
            overlays.unstable
        ];

        darwinConfigurations = lib.attrsets.mergeAttrsList (map (host: host.darwinConfigurations ) darwin_host_values);
    };
}
