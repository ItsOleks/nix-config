{ inputs, withSystem, module_args, myLib, ... }: 
let
  mkImports = myLib.mkImports sharedModules;

  homeImports = 
    mkImports "nut" "agovale" 
      [
        ../programs
        ../terminals/kitty.nix
        ../wm
        ../editors/neovim
	../programs/godot.nix
	../programs/latex.nix
	../programs/vial.nix
      ] //
    mkImports "nut" "ector"
      [
        ../programs
        ../terminals/kitty.nix
	../programs/latex.nix
        ../editors/nvim
        ../wm
      ];

  sharedModules = [
    ../.
    ../shell
    inputs.anyrun.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
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
