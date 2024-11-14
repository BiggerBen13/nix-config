{
  pkgs,
  lib,
  config,
  ...
}: {
  home.activation.InstallYabaiRC = lib.hm.dag ["writeBoudary"] ''
    rsync -v ${./yabairc} ${config.xdg.configHome}/yabai/
  '';
  services = {
    yabai = {
      enable = true;
      package = pkgs.yabai;
    };
  };
}
