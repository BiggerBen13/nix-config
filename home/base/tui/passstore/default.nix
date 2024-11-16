{
  pkgs,
  config,
  lib,
  ...
}: let
  passwordStoreDir = "${config.xdg.dataHome}/password-store";
in {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-import
      exts.pass-update
    ]);

    settings = {
      PASSWORD_STORE_DIR = passwordStoreDir;

      PASSWORD_STORE_CLIP_TIME = "60";
      PASSWORD_STORE_GENERATED_LENGTH = "15";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
    };
  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
    ];
  };
}
