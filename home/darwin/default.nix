{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";
  imports =
    [
      ./apps.nix
      ./browsers.nix
      # ./skhd
      ./shells
      # ./yabai
    ]
    ++ [
      ../base/home.nix
      ../base/tui
      ../base/core
    ];
}
