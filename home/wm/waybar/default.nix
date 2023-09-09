{ pkgs, config, myLib, lib, ... }:
let
inherit (config.lib.file) mkOutOfStoreSymlink;
location = "${config.home.homeDirectory}/.dotfiles/home/wm/waybar";

mapFiles = src: dst: names: {
  home.file = builtins.foldl' (x: y: x // y) {} 
    (builtins.map 
      (name: {"${dst}/${name}".source = mkOutOfStoreSymlink "${src}/${name}";}) 
      names
    );
};
files = mapFiles "${location}" ".config/waybar" [ 
  "config"
  "style.css"
  "mocha.css"
];
in {
  programs.waybar = {
    enable = true;
    package = (pkgs.waybar.override {withMediaPlayer = true;});
  };
  home.packages = with pkgs; [
    (writeShellScriptBin "waybar-update" ''
      #!/bin/bash

      CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css"
      trap "killall waybar" EXIT

      while true; do
        waybar &
          inotifywait -e create,modify $CONFIG_FILES
          killall waybar
          done
    '')
  ];
} //
files
