{ pkgs, lib, inputs, ... }: {
  imports = [
    ./hyprland
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # utils
    wf-recorder
    wl-clipboard
    rofi-wayland
    waybar
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [wlrobs];
}
