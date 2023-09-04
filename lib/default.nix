{ lib, ... }:
let
  myLib = import ./functions.nix lib;
in {
  imports = [
    {
      _module.args = {
        inherit myLib;
      };
    }
  ];
}
