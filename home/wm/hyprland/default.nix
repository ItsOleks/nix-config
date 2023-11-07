{ inputs, lib, pkgs, ... }: {
  imports = [./config.nix];

  home.packages = with pkgs; [
    jaq
    xorg.xprop
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    brightnessctl
  ];

  wayland.windowManager.hyprland.enable = true;
}
