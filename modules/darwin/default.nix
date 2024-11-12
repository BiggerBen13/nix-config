{...}: {
  imports =
    [
      ./apps.nix
      ./nix-core.nix
      ./users.nix
    ]
    ++ [../base.nix];
}
