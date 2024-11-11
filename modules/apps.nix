{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    apps.enable = lib.mkEnableOption "enable gui apps";
  };
  config = lib.mkIf config.apps.enable {
    environment.systemPackages = with pkgs; [
      sioyek
      zathura
    ];
  };
}
