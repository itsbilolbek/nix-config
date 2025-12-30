{
  description = "Home Manager configuration of kebol";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/release-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    uzbek-xcompose.url = "github:itsbilolbek/uzbek-xcompose";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    plasma-manager,
    ...
  } @ inputs: let
    #     system = "x86_64-linux";
    #     pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/hp/configuration.nix
        stylix.nixosModules.stylix
        #         inputs.uzbek-xcompose.homeManagerModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          # home-manager.sharedModules = [plasma-manager.homeModules.plasma-manager];
          home-manager.users.mocha = {
            imports = [
              ./modules/home
              inputs.stylix.homeModules.stylix
              inputs.plasma-manager.homeModules.plasma-manager
            ];
          };
          home-manager.extraSpecialArgs = {inherit inputs;};
        }
      ];
    };
  };
}
