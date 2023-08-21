{ inputs, config, pkgs, ... }: {
  programs.steam.enable = true;
  programs.fish.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
     dunst
     libnotify
     swww
     telegram-desktop
     discord
     htop
     waybar-hyprland
     killall
     qt6.qtwayland
     qt5.qtwayland
     lm_sensors
     home-manager
  ];
}
