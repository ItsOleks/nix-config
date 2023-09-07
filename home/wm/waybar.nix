{ pkgs, config, myLib, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar =
        let
        shared-left = [
          "hyprland/workspaces"

        ];

        shared-center = [

        ];

        shared-right = [

        ];
        in {
        layer = "top";

        modules-left = shared-left;

        modules-center = shared-left;

        modules-right = shared-left;
      };
    };
  };

}
