{...}: {
  imports =
    [
      ./apps.nix
      ./nix-core.nix
    ]
    ++ [../base.nix];
}
