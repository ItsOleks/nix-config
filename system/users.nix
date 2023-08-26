{ pkgs, ... }: {
  users = {
    users.nut = {
      isNormalUser = true;
      description = "Oleks";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDB0k8zFEq3orzqskwzHGpYy1KTThyc6LGBX8lHp20dKBtEyLAm65Reus0LFofw8CMUx3r4neioCrNrWnt5D/Vwmd5OKMK5/nBf6md9cm1ebjpXt+l5OMS2d/drEuJYH2xkEoqJCxqALQU03Pd3eqBHlsPDMgJmF6HwpEKqsfLACNNYKnQJt7BF4Q//eQK+GSTOKZl8vc/Pk/aPlO+xd/fTp3Ecj2vcdZmzjevehwSYW+kAWI6UjAmZTUiz9BAImQEUTxgJm7DIr2OJISv5fvn3orvM3A/EuRrGsHT2kWz8sXRjxn6W9xvLyCSg0F+IGfI8Zvj03dB/7FgXDGsmc6dpZEJS4Zr7eM/5n5+nIhYvSQKm8elj7i8HwOdAjgSZiLUrvnMAtVWBO92qXAqv0gz2wX5T2s46oh3zGeX51pUN4q0p6+DC1zgNPfSh54gamtpXh8+BxVGfeIXSo9hc1CX6tlQRY+lcM8pQJWZUiTMtixzMFMbR3OPtuSiLGBfwtvk= nut@NixNut"
      ];
    };
  };
}
