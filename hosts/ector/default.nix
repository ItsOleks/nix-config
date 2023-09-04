{ config, pkgs, self, ... }: {
  imports = [./hardware-configuration.nix];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader.systemd-boot.enable = true;
  };

  networking.hostName = "ector";

  programs = {
    hyprland.enable = true;
    steam.enable = true;
  };
}
