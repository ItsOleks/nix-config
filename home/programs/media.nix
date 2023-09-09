{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    helvum
    spotify
    playerctl
  ];
  
  programs.obs-studio.enable = true;
}
