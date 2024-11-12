{
  myvars,
  pkgs,
  pkgs-stable,
  ...
} @ args: {
  nix.package = pkgs.nixVersions.latest;

  environment.systemPackages = with pkgs; [
    # Github
    git
    git-lfs
    # Compression Tools
    zip
    xz
    zstd
    unzipNLS
    p7zip
    # Text processing tools
    gnugrep
    gnused
    gawk
    jq
    # Networking tools
    mtr
    dnsutils
    ldns
    curl
    aria2
    nmap
    ipcalc
    # Filesystem tools
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    trusted-users = [myvars.username];
  };

  users.users.${myvars.username} = {
    description = myvars.userfullanme;
  };
}
