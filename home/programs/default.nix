{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./games.nix
    ./media.nix
    ./dunst.nix
    ./gtk.nix
    ./qt.nix
  ];

  programs = {
    firefox.enable = true;
  };

  home.packages = with pkgs; [
    telegram-desktop
    discord
    revolt-desktop
    webcord

    libnotify
    xdg-utils

    obsidian
    xfce.thunar
    xarchiver

  ];
}
