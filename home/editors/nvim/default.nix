{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc
      texlab
    ];
    withPython3 = true;
  };
}
