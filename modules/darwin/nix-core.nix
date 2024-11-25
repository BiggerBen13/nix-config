{
  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;

  # disabled until reported issue resolved
  nix.settings.auto-optimise-store = false;

  nix.gc.automatic = false;

  nix.linux-builder = {
    enable = true;
    maxJobs = 4;
    config = {
      virtualisation = {
        darwin-builder = {
          diskSize = 40 * 1024;
          memorySize = 8 * 1024;
        };
        cores = 6;
      };
    };
    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };

  system.stateVersion = 5;
}
