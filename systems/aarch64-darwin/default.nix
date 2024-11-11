{
  lib,
  inputs,
  ...
} @ args: let
  macosSystem = import ./macosSystem.nix;

  hosts = ["powerbookpro"];
  hostConfigs = map (config: import ./hosts/${config}.nix (args // {inherit macosSystem;})) hosts;

  hostConfigsData = builtins.concatLists (map (config: builtins.attrValues config) hostConfigs);
  outputs = {darwinConfigurations = lib.attrsets.mergeAttrsList hostConfigsData;};
in
  outputs // {inherit hostConfigs;}
