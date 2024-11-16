{
  pkgs,
  pkgs-stable,
  lib,
  ...
}: {
  programs.eww = {
    enable = true;
    package = pkgs.eww;
  };
}
