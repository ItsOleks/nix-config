{ lib, inputs }: rec {
  # extremely scuffed bootleg switch statement
  switch = key: attrset:
    if attrset ? "${key}" then
      attrset."${key}"
    else
      attrset.default;
  
  # scuffed as shit function to create a home manager config quickly
  # also passes host and name in case they are needed for extra config options
  mkHomeConfigs = pkgs: homeImports:
    lib.attrsets.mapAttrs
      (n: v:
        inputs.home-manager.lib.homeManagerConfiguration {
          modules = homeImports."${n}";
          inherit pkgs;
        })
      homeImports;

  mkImports = username: host: imports: {
    "${username}@${host}" = imports ++ [{_module.args = {inherit username host;};}];
  };
} 
