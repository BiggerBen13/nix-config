{
  pkgs,
  lib,
  config,
  ...
}: {
  home.activation.InstallYabaiRC = lib.hm.dag.entryAfter ["writeBoudary"] ''
    ${pkgs.rsync}/bin/rsync -v ${./yabairc} ${config.xdg.configHome}/yabai/
  '';
  # services = {
  #   yabai = {
  #     enable = true;
  #     package = pkgs.yabai;
  #   };
  # };
}
