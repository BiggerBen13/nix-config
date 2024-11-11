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

        # system = "aarch64-darwin";
        # configuration = { pkgs, lib, config, ... }:  {
        #
        # # List packages installed in system profile. To search by name, run:
        # # $ nix-env -qaP | grep wget
        # environment.systemPackages =
        #     [ 
        #         pkgs.qmk
        #         pkgs.skhd
        #         pkgs.yabai
        #         pkgs.llvmPackages.clang-tools
        #         pkgs.fish
        #     ];
        #
        # system.activationScripts.applications.text = let
        #     env = pkgs.buildEnv {
        #         name = "system-applications";
        #         paths = config.environment.systemPackages;
        #         pathsToLink = "/Applications";
        #     };
        # in
        #
        #     pkgs.lib.mkForce ''
        #     # Set up applications.
        #     echo "setting up /Applications..." >&2
        #     rm -rf /Applications/Nix\ Apps
        #     mkdir -p /Applications/Nix\ Apps
        #     find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        #     while read src; do
        #     app_name=$(basename "$src")
        #     echo "copying $src" >&2
        #         ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        #     done
        #     '';
        #
        # users.users.biggerben = {
        #     shell = pkgs.fish;
        # };
        #
        # fonts.packages =
        #     [
        #         (pkgs.nerdfonts.override { fonts = ["IosevkaTermSlab"];})
        #     ];
        #
        # homebrew = {
        #     enable = true;
        #     casks = [
        #         "logisim-evolution"
        #         "xonotic"
        #     ];
        #     onActivation.cleanup = "zap";
        #     onActivation.autoUpdate = true;
        #     onActivation.upgrade = true;
        # };
        #
        #
        #
        # # Auto upgrade nix package and the daemon service.
        # services.nix-daemon.enable = true;
        # # nix.package = pkgs.nix;
        #
        # # Necessary for using flakes on this system.
        # nix.settings.experimental-features = "nix-command flakes";
        #
        # programs.zsh.enable = true;
        # programs.fish.enable = true;
        # services.skhd.enable = true;
        # services.skhd.package = pkgs.skhd;
        # services.yabai.enable = true;
        # services.yabai.package = pkgs.yabai;
        #
        # # Set Git commit hash for darwin-version.
        # system.configurationRevision = self.rev or self.dirtyRev or null;
        #
        # # Used for backwards compatibility, please read the changelog before changing.
        # # $ darwin-rebuild changelog
        # system.stateVersion = 5;
        #
        # # The platform the configuration will be used on.
        # nixpkgs.hostPlatform = "aarch64-darwin";
        # };
    in
        {
        nixpkgs.overlays = [
            overlays.unstable
        ];

        darwinConfigurations = lib.attrsets.mergeAttrsList (map (host: host.darwinConfigurations ) darwin_host_values);
        # Build darwin flake using:
        # # $ darwin-rebuild build --flake .#powerbookpro
        # darwinConfigurations."powerbookpro" = nix-darwin.lib.darwinSystem {
        #     specialArgs = {
        #         inherit inputs outputs;
        #     };
        #     modules = [ 
        #         configuration
        #         ./configuration.nix
        #         nix-homebrew.darwinModules.nix-homebrew
        #         {
        #             nix-homebrew = {
        #                 enable = true;
        #                 # Apple Silicon Only
        #                 enableRosetta = true;
        #                 # User owning the homebrew prefix
        #                 user = "biggerben";
        #                 # autoMigrate = true;
        #             };
        #         }
        #     ];
        # };
        #
        # # Expose the package set, including overlays, for convenience.
        # darwinPackages = self.darwinConfigurations."powerbookpro".pkgs;
    };
}
