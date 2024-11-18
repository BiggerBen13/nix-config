{...}: {
  imports =
    [
      ./apps.nix
      ./nix-core.nix
      ./users.nix
      ./virtualisation.nix
    ]
    ++ [../base.nix];
}
