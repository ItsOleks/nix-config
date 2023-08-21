{
  description = "Nut's system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = { 
        allowUnfree = true; 
      };
    };
  in {

    nixosConfigurations = {
      NixNut = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

	modules = [
          ./system/configuration.nix
	];
      };
    };

    homeConfigurations = {
      "nut" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; }; 

        modules = [ 
	  ./home-manager/home.nix 
	];
      };
    };
  };
}
