{ pkgs, ... }: {
 
  home.packages = with pkgs; [
    (pkgs.writeShellScriptBin "ha" ''
      home-manager switch --flake /home/nut/nix-config/#nut
    '')
    (pkgs.writeShellScriptBin "sa" ''
      sudo nixos-rebuild switch --flake /home/nut/nix-config/#
    '')
    (pkgs.writeShellScriptBin "he" ''
      vi ~/nix-config/home-manager/
    '')
    (pkgs.writeShellScriptBin "se" ''
      vi ~/nix-config/system/
    '')
    (pkgs.writeShellScriptBin "sy" ''
      nix flake update /home/nut/nix-config
    '')
  ];
}
