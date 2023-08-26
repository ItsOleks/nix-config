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
     waybar
     killall
     qt6.qtwayland
     qt5.qtwayland
     lm_sensors
     home-manager
  ];

  services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
  };
}
