{ pkgs, config, myLib, lib, ... }:
let
inherit (config.lib.file) mkOutOfStoreSymlink;
location = "${config.home.homeDirectory}/.dotfiles/home/wm/waybar";

mapFiles = src: dst: names:
  lib.foldr lib.recursiveUpdate {}
    (builtins.map 
      (name: {home.file."${dst}/${name}".source = mkOutOfStoreSymlink "${src}/${name}";}) 
      names
    );
files = mapFiles "${location}" ".config/waybar" [ 
  "config"
  "style.css"
  "mocha.css"
];
in {
  imports = [files];
  programs.waybar = {
    enable = true;
    package = (pkgs.waybar.override {withMediaPlayer = true;});
  };
  home.packages = [
    (pkgs.writeShellScriptBin "waybar-reload" ''
      #!bin/sh
      CONFIG_FILES="${location}/config ${location}/style.css"
      
      trap "killall .waybar-wrapped" EXIT

      while true; do
        waybar &
        inotifywait -e modify $CONFIG_FILES
        killall .waybar-wrapped
        sleep 1
      done
    '')
    
  ];
}