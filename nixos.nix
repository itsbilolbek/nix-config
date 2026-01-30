{ inputs, ... }:
{
  flake = {
    nixosConfigurations."xenon" = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/xenon/configuration.nix
        inputs.stylix.nixosModules.stylix

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            users.mocha = {
              imports = [
                ./modules/home
                inputs.stylix.homeModules.stylix
              ];
            };
          };
        }
      ];
    };
  };
}
