{ lib, inputs }: {
  switch = key: attrset:
    if attrset ? "${key}" then
      attrset."${key}"
    else
      attrset.default;
  
  # scuffed as shit function to create a home manager config quickly
  # also passes host and name in case they are needed for extra config options
  mkHomeConfig = pkgs: homeImports: name: host:
  let
    nameHost = "${name}@${host}";
  in {
      "${nameHost}" = inputs.home-manager.lib.homeManagerConfiguration {
        modules = homeImports."${nameHost}";
        extraSpecialArgs = {
          inherit host;
          inherit name;
        };
        inherit pkgs;
      };
    };
} 
