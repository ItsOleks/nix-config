{ config, pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    colorschemes.tokyonight.enable = true;

    clipboard.register = "unnamedplus";

    options = {
      relativenumber = true;

      shiftwidth = 2;
    };
  };
}
