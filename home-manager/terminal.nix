{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.package = pkgs.nerdfonts;
    font.name = "MesloLGS NF";
    shellIntegration.enableFishIntegration = true;
    theme = "Tokyo Night";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa --long --icons --all";
    };
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    ];
  };

  programs.starship = {
    enable = false;
    enableFishIntegration = true;
  };
}
