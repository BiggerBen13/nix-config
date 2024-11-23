{pkgs, ...}: {
  home.packages = with pkgs; [
    sioyek
    zathura
    inkscape
    # alacritty
    # kicad
    # Not yet available on darwin
    # freecad
  ];
}
