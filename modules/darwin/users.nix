{
  myvars,
  pkgs,
  ...
}: {
  users.users."${myvars.username}" = {
    home = "/Users/${myvars.username}";
    shell = pkgs.zsh;
  };
}
