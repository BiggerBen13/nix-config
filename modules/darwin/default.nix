{...}: {
  imports =
    [
      ./apps.nix
      ./nix-core.nix
      ./users.nix
      ./system.nix
      # ./virtualisation.nix
    ]
    ++ [../base.nix];
}
