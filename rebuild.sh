#!/bin/bash
set -e
pushd ~/nix
git diff -U0 *.nix
nix fmt &> /dev/null
echo "Nix Rebuilding"
darwin-rebuild switch --flake ~/nix
gen=$(darwin-rebuild --list-generations \
    | grep "current" \
    | sed -EH 's/(\d+)\s+((\d+-)+\d+)\s+((\d+:)+\d+).*/GEN: \1 on: \2 at: \4/')
git commit -am "$gen"
popd
