{ config, pkgs, inputs, lib, ... }: {
  environment.variables.FLAKE = "/home/nut/.dotfiles";

  nh = {
      enable = true;
      clean.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      keep-derivations = true;
      keep-outputs = true;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [

    ];
  };
}
