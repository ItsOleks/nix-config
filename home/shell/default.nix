{ config, ... }: {
  imports = [
    ./cli.nix
    ./fish.nix
    ./nix.nix
  ];
}
