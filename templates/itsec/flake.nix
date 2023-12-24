{
  description = "Flake template for my C homework assignments";

  outputs = inputs: 
  let 
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in
  {
    devShells.x86_64-linux.default =
      pkgs.mkShell
      {
        nativeBuildInputs = with pkgs; [
	  gcc
	  (python3.withPackages 
	    (ps: with ps; [
	    ])
	  )
	];
      };
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
}
