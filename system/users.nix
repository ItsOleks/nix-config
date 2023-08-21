{ pkgs, ... }: {
  users = {
    users.nut = {
      isNormalUser = true;
      description = "Oleks";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };
  };
}
