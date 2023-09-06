{ pkgs, self, inputs, ... }: {
  # TODO separate out the laptop only stuff
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols
      font-awesome

      # normal fonts
      lexend
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto

      #nerd fonts
      nerdfonts
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Roboto Serif" "Noto Color Emoji"];
      sansSerif = ["Roboto" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
  # use Wayland where possible (electron)
  environment.variables.NIXOS_OZONE_WL = "1";

  hardware = {
    opengl = {
      enable = true;
    };
  };

  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  security = {
    pam.services.gtklock.text = "auth include login";
    rtkit.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  };
}
