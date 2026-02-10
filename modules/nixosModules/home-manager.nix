{ inputs, self, ... }:
{
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  flake.nixosModules.home-manager =
    { config, ... }:
    let
      username = config.preferences.user.name;
    in
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        overwriteBackup = true;
        extraSpecialArgs = { inherit username; };
        users.${username}.imports = [ self.homeModules.defaultUser ];
      };
    };
}
