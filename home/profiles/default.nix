{ inputs, withSystem, module_args, myLib, ... }: 
let
  sharedModules = [
    ../.
    ../shell
    module_args
  ];
  
  homeImports = {
      "nut@agovale" = [
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
      ] ++ sharedModules;

      "nut@ector" = [
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
      ] ++ sharedModules;
  };

in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}:
    let 
    mkHomeConfig = myLib.mkHomeConfig pkgs homeImports;
    in
      mkHomeConfig "nut" "agovale" //
      mkHomeConfig "nut" "ector"
    );
  };
}
