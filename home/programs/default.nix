{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./games.nix
    ./media.nix
    ./dunst.nix
  ];

  programs = {
    firefox.enable = true;
  };

  home.packages = with pkgs; [
    telegram-desktop
    discord

    libnotify
    xdg-utils

    obsidian
  ];
}
