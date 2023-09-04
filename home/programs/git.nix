{
  config,
  pkgs,
  default,
  ...
}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userEmail = "makhmudov.oleksandr@gmail.com";
    userName = "Oleksandr Makhmudov";
  };
}
