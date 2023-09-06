{ pkgs, ... }:{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.nut.enableGnomeKeyring = true;
  programs.seahorse.enable = true;

  environment.systemPackages = with pkgs; [
    libsecret
  ];
}
