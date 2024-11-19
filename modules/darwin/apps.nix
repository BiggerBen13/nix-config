{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  myvars,
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
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "gnu-tar"
      "gnu-sed"
      "m-cli"
      {
        name = "libvirt";
        restart_service = "changed";
        link = true;
      }
      "qemu"
      "virt-manager"
    ];

    casks = [
      "logisim-evolution"
      "xonotic"
      "freecad"
      "kicad"
      "firefox"
      "librewolf"
    ];
  };

  services = {
    skhd = {
      enable = true;
      package = pkgs.skhd;
    };
    yabai = {
      enable = true;
      package = pkgs.yabai;
    };
  };

  programs.zsh.enable = true;
  programs.fish.enable = true;
}
