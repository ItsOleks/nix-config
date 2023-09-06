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

    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
