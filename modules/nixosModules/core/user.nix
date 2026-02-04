{
  flake.nixosModules.core =
    { lib, ... }:
    let
      inherit (lib) mkOption types;
    in
    {
      options.preferences = {
        user.name = mkOption {
          type = types.str;
          default = "mocha";
        };
      };
    };
}
