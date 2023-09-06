{ lib, config, inputs, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    package = inputs.helix.packages."${pkgs.system}".default;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
  };
}
