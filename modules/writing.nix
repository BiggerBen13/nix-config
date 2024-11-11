{pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        # Typst
        unstable.typst
        unstable.tinymist
        unstable.typstfmt
    ];
}
