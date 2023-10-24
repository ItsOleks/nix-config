{ pkgs, ... }: {
  home.packages = with pkgs; [
    godot-4
  ];
}
