{ pkgs, ... }:
{
  flake.templates = {
    c-flake = {
      path = ./c-flake;
      description = "Flake template for my C homework assignments";
    };
  };
}
