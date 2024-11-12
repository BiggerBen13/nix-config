{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs; [
    pkgs-unstable.neovim
    git
    fish

    # Gonna try this out, maybe it's cool
    utm
  ];

  environment.variables = {
    TERM_INFOS = map (path: path + "/share/terminfo") config.environment.profiles ++ ["/usr/share/terminfo/"];
    EDITOR = "nvim";
  };

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "gnu-tar"
      "gnu-sed"
      "m-cli"
    ];

    casks = [
      "logisim-evolution"
      "xonotic"
    ];
  };

  services.skhd.enable = true;
  services.skhd.package = pkgs.skhd;
  services.yabai.enable = true;
  services.yabai.package = pkgs.yabai;

  programs.zsh.enable = true;
  programs.fish.enable = true;
}
