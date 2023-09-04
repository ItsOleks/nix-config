{ lib, inputs, pkgs, ... }:
let
  myLib = import ./functions.nix { inherit lib inputs; };
in {
  imports = [
    {
      _module.args = {
        inherit myLib;
      };
    }
  ];
}
