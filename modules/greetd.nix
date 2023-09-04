{ config, lib, pkgs, ... }:
let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    # `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.

    exec "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP"

    xwayland disable

    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
    
    exec "${lib.getExe config.programs.regreet.package}; swaymsg exit"
  '';
in
{
  services.greetd.settings.default_session.command = "${pkgs.sway}/bin/sway --config ${swayConfig}";

  programs.regreet = {
    enable = true;
  };

  programs.sway.enable = true;

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}
