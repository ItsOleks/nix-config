{inputs, sharedModules, homeImports, ...}: {
  flake.nixosConfigurations =
  let
    inherit (inputs.nixpkgs.lib) nixosSystem;
  in {
    agovale = nixosSystem {
      modules = [
        ./agovale
        ../modules/desktop.nix
        ../modules/docker.nix
        ../modules/greetd.nix
        {home-manager.users.nut.imports = homeImports."nut@agovale";}
      ] ++ sharedModules;
    };

    ector = nixosSystem {
      modules = [
        ./ector
        ../modules/desktop.nix
        ../modules/docker.nix
        ../modules/gdm.nix
        {home-manager.users.nut.imports = homeImports."nut@ector";}
      ] ++ sharedModules;
    };
  };
}
