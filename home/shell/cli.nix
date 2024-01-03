{ pkgs, ... }: {
  home.packages = with pkgs; [
    zip
    unzip
    unrar

    # utils
    fd
    fzf
    ripgrep
    killall
    inotify-tools

    # file manager
    ranger
  ];

  programs = {
    exa.enable = true;
    btop.enable = true;
    ssh.enable = true;
  };
}
