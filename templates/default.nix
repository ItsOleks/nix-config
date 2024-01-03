{ pkgs, ... }:
{
  flake.templates = {
    c-flake = {
      path = ./c-flake;
      description = "Flake template for my C homework assignments";
    };
    itsec = {
      path = ./itsec;
      description = "Flake template for my itsec homework assignments";
    };
    opengl = {
      path = ./opengl;
      description = "Flake template for my opengl experiments";
    };
  };
}
