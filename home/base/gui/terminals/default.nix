{pkgs, ...}: {
  imports = [
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    rio
  ];
}
