{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";
  imports =
    [
      ./apps.nix
      ./browsers.nix
      ./skhd
      ./yabai
    ]
    ++ [
      ../base/home.nix
      ../base/tui
      ../base/core
    ];
}
