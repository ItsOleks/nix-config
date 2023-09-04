{ self, inputs, default, ... }:
let
  module_args._module.args = {
    inherit default inputs self;
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
