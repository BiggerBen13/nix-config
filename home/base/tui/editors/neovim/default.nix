{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}: let
  currentPath = builtins.toPath ./.;
in {
  home.activation.installNvimConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    rm -rf ${config.xdg.configHome}/nvim && ln -s ${currentPath}/nix/home/base/tui/editors/neovim/nvim ${config.xdg.configHome}/nvim
  ''; # --chmod=D255,F745
  # ${pkgs.rsync}/bin/rsync -avz  ${./nvim}/ ${config.xdg.configHome}/nvim/

  programs = {
    neovim = {
      enable = true;
      package = pkgs-unstable.neovim-unwrapped;

      defaultEditor = true;

      extraWrapperArgs = with pkgs; [
        # LIBRARY_PATH is used by gcc before compilation to search directories
        # containing static and shared libraries that need to be linked to your program.
        "--suffix"
        "LIBRARY_PATH"
        ":"
        "${lib.makeLibraryPath [stdenv.cc.cc zlib]}"

        # PKG_CONFIG_PATH is used by pkg-config before compilation to search directories
        # containing .pc files that describe the libraries that need to be linked to your program.
        "--suffix"
        "PKG_CONFIG_PATH"
        ":"
        "${lib.makeSearchPathOutput "dev" "lib/pkgconfig" [stdenv.cc.cc zlib]}"
      ];

      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
      ];
    };
  };
}
