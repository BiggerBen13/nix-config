{
  config,
  pkgs-unstable,
  ...
}: let
  # localBin = "${config.home.homeDirectory}/.local/bin";
  rustBin = "${config.home.homeDirectory}/.cargo/bin";
  brewBin = "/opt/homebrew/bin";
  envExtra = "${rustBin}\n${brewBin}";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = "export PATH=$PATH:${rustBin}:${brewBin}";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = "export PATH=$PATH:${rustBin}:${brewBin}";
    # inherit envExtra;
  };

  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
  };

  # programs.fish.shellInit = ''set PATH $PATH ${localBin} ${rustBin} ${brewBin}'';
}
