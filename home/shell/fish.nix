{ config, pkgs, lib, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa --long --icons --all";
      oly = "distrobox enter archlinux -- /home/arch/linux.main/olympus";
    };
    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
    ];
  };
}
