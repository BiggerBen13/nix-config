{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
