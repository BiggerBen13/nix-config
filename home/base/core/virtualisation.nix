{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    qemu
    libvirt
    virt-manager
  ];
}
