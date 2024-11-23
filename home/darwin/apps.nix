{pkgs, ...}: {
  home.packages = with pkgs; [
    sioyek
    zathura
    inkscape
    kitty
    # alacritty
    # kicad
    # Not yet available on darwin
    # freecad
  ];
}
