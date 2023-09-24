{ pkgs, config, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
    extraPackages = epkgs:
      with pkgs; [
        epkgs.vterm

        (ripgrep.override { withPCRE2 = true; })
        gnutls
        binutils

        fd
        imagemagick
        zstd
        gnumake
        cmake

        (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
        editorconfig-core-c
        sqlite

        #docker
        dockfmt

        #cc
        clang-tools
        glslang

        #java
        jdk

        #markdown
        multimarkdown

        #nix
        nixfmt

        #python
        python3
      ];
  };
  home.packages = [ pkgs.python311Packages.python-lsp-server ];

  services.emacs = {
    enable = true;
    client.enable = true;
    package = pkgs.emacsNativeComp;
  };

  home.sessionPath = [ "$HOME/.config/emacs/bin" ];
}
