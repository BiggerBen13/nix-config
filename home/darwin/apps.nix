{pkgs, ...}: {
  home.packages = with pkgs; [
    sioyek
    zathura
    # kicad
    # Not yet available on darwin
    # freecad
  ];
}
