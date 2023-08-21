{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.package = pkgs.nerdfonts;
    font.name = "JetBrainsMono";
    shellIntegration.enableFishIntegration = true;
    theme = "Tokyo Night";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa --long --icons --all";
      doom = "~/.config/emacs/bin/doom";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
