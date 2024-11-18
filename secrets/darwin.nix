{
  config,
  pkgs,
  agenix,
  mysecrets,
  myvars,
  ...
}: {
  imports = [
    agenix.darwinModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  age.identityPaths = ["/etc/ssh/ssh_host_ed25519_key"];

  # age.secrets = {
  #       "ssh-key" = ;
  # };
}
