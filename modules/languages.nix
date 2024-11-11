{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Rust tooling
    rustup

    # Zig tooling
    zig
    zls
  ];
}
