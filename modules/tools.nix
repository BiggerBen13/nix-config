{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tmux
    yt-dlp
    eza
    ffmpeg
    ffmpegthumbnailer
    fzf
    ripgrep
    git-lfs
    git
    unstable.neovim
    bear
    entr
    mpv
    # jack1
  ];
}
