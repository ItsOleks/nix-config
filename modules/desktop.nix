{ pkgs, self, inputs, config, ... }: {
  # TODO separate out the laptop only stuff
  fonts = {
    packages = with pkgs; [
      # icon fonts
      font-awesome

      # normal fonts
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      #nerd fonts
      nerdfonts
      emacs-all-the-icons-fonts
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Roboto Serif" "Noto Color Emoji"];
      sansSerif = ["Roboto" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji" "FontAwesome"];
      emoji = ["Noto Color Emoji" "FontAwesome"];
    };
  };

  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  hardware = {
    opengl = {
      enable = true;
    };
  };

  services.udev.packages = with pkgs; [
    vial
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };

  #for obs virtual camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
}
