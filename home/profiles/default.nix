{ inputs, withSystem, module_args, myLib, ... }: 
let
  inherit (myLib) mkImports;

  homeImports = 
    mkImports "nut" "agovale" 
      ([
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
      ] ++ sharedModules) //
    mkImports "nut" "ector"
      ([
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
      ] ++ sharedModules);

  sharedModules = [
    ../.
    ../shell
    inputs.anyrun.homeManagerModules.default
    module_args
  ];

in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}:
      myLib.mkHomeConfigs pkgs homeImports
    );
  };
}
