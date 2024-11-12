{
  mylib,
  myvars,
  ...
}: {
  home.homeDirectory = "/Users/biggerben";
  imports =
    [
      ./apps.nix
    ]
    ++ [
      ../base/home.nix
      ../base/tui
      ../base/core
    ];
}
