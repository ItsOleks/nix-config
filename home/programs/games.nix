{ pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    itch
    love
    steam-tui
    steamPackages.steamcmd
    r2modman
  ];
}
