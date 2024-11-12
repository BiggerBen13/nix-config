{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs;
  # Configuration Languages
    [
      # Nix stuff
      nil
      nixd
      statix
      deadnix
      alejandra
    ]
    ++
    # General Purpose Programming Languages
    [
      #--C/C++
      cmake
      cmake-language-server
      gnumake
      checkmake
      gcc
      # gdb
      llvmPackages.clang-unwrapped
      lldb
      vscode-extensions.vadimcn.vscode-lldb.adapter

      #--Rust
      pkgs-unstable.rustc
      pkgs-unstable.rust-analyzer
      pkgs-unstable.cargo
      pkgs-unstable.rustfmt
      pkgs-unstable.clippy

      #-Zig
      zig
      zls
    ];
}
