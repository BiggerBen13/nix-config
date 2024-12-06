{pkgs, ...}: {
  home.packages = with pkgs; [
    tldr
    gnupg
    gnumake

    fzf
    carapace

    fd

    (ripgrep.override {withPCRE2 = true;})

    ast-grep

    sad
    delta
    gping
    duf
    du-dust
    gdu

    caddy
    croc
    # ncdu

    tmux
  ];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };

    fzf = {
      enable = true;
    };
  };
}
