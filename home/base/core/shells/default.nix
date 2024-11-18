{
  config,
  pkgs-unstable,
  ...
}: let
  localBin = "${config.home.homeDirectory}/.local/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
  brewBin = "/opt/homebrew/bin";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''export PATH=$PATH:${localBin}:${rustBin}:${brewBin}'';
  };

  programs.fish.shellInit = ''set PATH $PATH ${localBin}:${rustBin}:${brewBin}'';
}
