{ pkgs, ... }: {
  home.packages = with pkgs; [
    zip
    unzip
    unrar

    # utils
    fd
    ripgrep
    killall

    # file manager
    ranger
  ];

  programs = {
    exa.enable = true;
    btop.enable = true;
    ssh.enable = true;
  };
}
