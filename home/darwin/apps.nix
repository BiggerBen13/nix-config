{pkgs, ...}: {
  home.packages = with pkgs; [
    sioyek
    zathura
    inkscape
    # kicad
    # Not yet available on darwin
    # freecad
  ];
}
