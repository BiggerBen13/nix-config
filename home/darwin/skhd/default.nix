{
  pkgs,
  lib,
  config,
  ...
}: {
  # home.activation.InstallSkhdRC = lib.hm.dag.entryAfter ["writeBoudary"] ''
  #   ${pkgs.rsync}/bin/rsync -v ${./skhdrc} ${config.xdg.configHome}/skhd/
  # '';
  # services = {
  #   skhd = {
  #     enable = true;
  #     package = pkgs.skhd;
  #   };
  # };
}
