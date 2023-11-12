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
    vesktop
    
    libnotify
    xdg-utils

    obsidian
    libsForQt5.okular
    xfce.thunar
    xarchiver

    distrobox
  ];
}
