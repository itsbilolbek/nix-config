{ inputs, self, ... }:
{
  flake.nixosModules.home-manager =
    { config, ... }:
    let
      username = config.preferences.user.name;
    in
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        users.${username} = {
          imports = [ self.homeModules.defaultUser ];
          home.username = username;
          home.homeDirectory = "/home/${username}";
        };
      };
    };
}
