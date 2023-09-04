{
  home = {
    username = "nut";
    homeDirectory = "/home/nut";
    stateVersion = "23.11";
  };

  # We want that funny unfree stuff
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  programs.home-manager.enable = true;
}
