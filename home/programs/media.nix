{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    pavucontrol
    helvum
    spotify
  ];
  
  programs.obs-studio.enable = true;
}
