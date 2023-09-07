{ inputs, withSystem, module_args, myLib, ... }: 
let
  mkImports = myLib.mkImports sharedModules;

  homeImports = 
    mkImports "nut" "agovale" 
      [
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
        ../editors/helix
      ] //
    mkImports "nut" "ector"
      [
        ../programs
        ../shell
        ../terminals/wezterm.nix
        ../wm
        ../editors/helix
      ];

  sharedModules = [
    ../.
    ../shell
    inputs.anyrun.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.fufexan.homeManagerModules.eww-hyprland
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
