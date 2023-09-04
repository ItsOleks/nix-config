{ self, inputs, myLib, ... }:
let
  module_args._module.args = {
    inherit myLib inputs self;
  };
in {
  imports = [
    {
      _module.args = {
        inherit module_args;

        sharedModules = [
          {home-manager.useGlobalPkgs = true;}
          inputs.home-manager.nixosModule
          inputs.hyprland.nixosModules.default
          inputs.nh.nixosModules.default
          module_args
          ./shared.nix
          ./network.nix
          ./nix.nix
        ];
      };
    }
  ];
}
