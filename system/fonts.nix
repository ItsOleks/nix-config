{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerdfonts
    google-fonts
  ];
}
