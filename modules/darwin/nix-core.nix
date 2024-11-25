{
  nixpkgs.config.allowUnfree = true;
  services.nix-daemon.enable = true;

  # disabled until reported issue resolved
  nix.settings.auto-optimise-store = false;

  nix.gc.automatic = false;

  nix.linux-builder.enable = true;

  system.stateVersion = 5;
}
