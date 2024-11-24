{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";
  imports =
    [
      ./apps.nix
      ./browsers.nix
      # ./skhd
      ./shells
      # ./yabai
      ./aerospace
    ]
    ++ [
      ../base/home.nix
      ../base/tui
      ../base/core
      ../base/gui
    ];
}
