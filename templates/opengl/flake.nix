{
  description = "opengl funny :D";

  outputs = inputs: 
  let 
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in
  {
    devShells.x86_64-linux.default =
      pkgs.mkShell
      {
	NIX_HARDENING_ENABLE = "";
        nativeBuildInputs = 
	(with pkgs; [
	  gcc
	  gdb
	  clang-tools
	  binutils
	  gnumake
	  cmake
	  
	  libGL
	  libGLU
	]) ++
	(with pkgs.xorg; [
	  libX11
	  libXi
	  libXrandr
	  libXext
	  libXcursor
	  libXinerama
	]);
      };
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
}
