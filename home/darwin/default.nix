{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";
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
