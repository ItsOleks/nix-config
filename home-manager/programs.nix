{ inputs, pkgs, ... }: {
  programs.gpg.enable = true;
  
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  home.packages = with pkgs; [
    wl-clipboard
    grim
    slurp
    pinentry_qt
    vial
    git-crypt
    firefox
    rofi-wayland
    lazygit
    obsidian
    ripgrep
    fd
    xfce.thunar
    helvum
    pavucontrol
    inputs.hyprwm-contrib.packages.${pkgs.system}.grimblast
    exa
    gnumake
    clang-tools
    lua-language-server
    spotify
    nil
  ];
}
