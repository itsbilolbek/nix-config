{
  description = "Bilolbek's NixOS configuration";

  inputs = {
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

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      git-hooks,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."xenon" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/xenon/configuration.nix
          stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager
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

      formatter.${system} =
        let
          inherit (self.checks.${system}.pre-commit-check.config) package configFile;
          script = ''
            ${pkgs.lib.getExe package} run --all-files --config ${configFile}
          '';
        in
        pkgs.writeShellScriptBin "pre-commit-run" script;

      checks.${system}.pre-commit-check = git-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          nixfmt.enable = true;
          statix.enable = true;
          deadnix.enable = true;

          end-of-file-fixer.enable = true;
          trim-trailing-whitespace.enable = true;

          check-added-large-files.enable = true;
          check-yaml.enable = true;
        };
      };

      devShells.${system} = {
        default =
          let
            pkgs = nixpkgs.legacyPackages.${system};
            inherit (self.checks.${system}.pre-commit-check) shellHook enabledPackages;
          in
          pkgs.mkShell {
            inherit shellHook;
            buildInputs = enabledPackages ++ [ pkgs.nixd ];
          };
      };
    };
}
