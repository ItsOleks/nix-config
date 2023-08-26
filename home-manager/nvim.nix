{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs; [ gcc ];
  };
}
