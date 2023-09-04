{ inputs, withSystem, module_args, ... }: 
let
  sharedModules = [
    ../.
    ../shell
    module_args
  ];
  
  homeImports = {
      "nut@agovale" = [./agovale] ++ sharedModules;
      "nut@ector" = [./ector] ++ sharedModules;
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in {
  imports = [
    {_module.args = {inherit homeImports;};}
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({pkgs, ...}: {
      "nut@agovale" = homeManagerConfiguration {
        modules = homeImports."nut@agovale";
        inherit pkgs;
      };

      "nut@ector" = homeManagerConfiguration {
        modules = homeImports."nut@ector";
        inherit pkgs;
      };
    });
  };
}
