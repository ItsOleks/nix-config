{ inputs, lib, pkgs, ... }: {
  imports = [./config.nix];

  home.packages = with pkgs; [
    jaq
    xorg.xprop
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  wayland.windowManager.hyprland.enable = true;
}
