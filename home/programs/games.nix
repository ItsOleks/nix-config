{ pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    itch
    love
  ];
}
