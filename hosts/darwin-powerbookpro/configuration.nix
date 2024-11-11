{ pkgs, config, overlays, ... }:  {
    nixpkgs = {
        overlays = [
            overlays.unstable
            # overlays.local
        ];
    };

    imports = [
        ../../modules/apps.nix
        ../../modules/tools.nix
        ../../modules/languages.nix
        ../../modules/writing.nix
    ];
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages =
        [ 
            pkgs.qmk
            pkgs.skhd
            pkgs.yabai
            pkgs.llvmPackages.clang-tools
            pkgs.fish
        ];

    system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
            name = "system-applications";
            paths = config.environment.systemPackages;
            pathsToLink = "/Applications";
        };
    in

        pkgs.lib.mkForce ''
                # Set up applications.
                echo "setting up /Applications..." >&2
                rm -rf /Applications/Nix\ Apps
                mkdir -p /Applications/Nix\ Apps
                find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
                while read src; do
                app_name=$(basename "$src")
                echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
                done
        '';

    users.users.biggerben = {
        shell = pkgs.fish;
    };

    fonts.packages =
        [
            (pkgs.nerdfonts.override { fonts = ["IosevkaTermSlab"];})
        ];

    homebrew = {
        enable = true;
        casks = [
            "logisim-evolution"
            "xonotic"
        ];
        onActivation.cleanup = "zap";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;
    };



    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;
    # nix.package = pkgs.nix;

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    programs.zsh.enable = true;
    programs.fish.enable = true;
    services.skhd.enable = true;
    services.skhd.package = pkgs.skhd;
    services.yabai.enable = true;
    services.yabai.package = pkgs.yabai;

    # Set Git commit hash for darwin-version.
    # system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 5;

    # # The platform the configuration will be used on.
    # nixpkgs.hostPlatform = "aarch64-darwin";
}
