{
  pkgs,
  default,
  ...
}: {
  # notification daemon
  services.dunst = {
    enable = true;
  };
}
