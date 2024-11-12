{
  config,
  pkgs-unstable,
  ...
}: let
  localBin = "${config.home.homeDirectory}/.local/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''export PATH=$PATH:${localBin}:${rustBin}'';
  };
}
