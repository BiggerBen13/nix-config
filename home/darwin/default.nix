{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";
  imports =
    [
      ./apps.nix
      ./browsers.nix
    ]
    ++ [
      ../base/home.nix
      ../base/tui
      ../base/core
    ];
}
