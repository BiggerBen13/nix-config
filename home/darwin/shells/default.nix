{
  config,
  pkgs-unstable,
  ...
}: let
  localBin = "${config.home.homeDirectory}/.local/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
  brewBin = "/opt/homebrew/bin:/usr/local/bin";
  pathExtra = "${localBin}:${rustBin}:${brewBin}";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''export PATH=$PATH:${localBin}:${rustBin}:${brewBin}'';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    envExtra = "export ${pathExtra}";
  };

  programs.fish.shellInit = ''set PATH $PATH ${localBin} ${rustBin} ${brewBin}'';
}
