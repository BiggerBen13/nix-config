{
  pkgs,
  lib,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qemu
    libvirt
    virt-manager
  ];

  # programs.virt-manager.enable = true;
  #
  # virtualisation = {
  #   libvirtd = {
  #     enable = true;
  #   };
  # };
}
