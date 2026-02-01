{
  flake.nixosModules.nix-settings =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      nix = {
        package = pkgs.nix;
        nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; # Use system nixpkgs for nixd lsp

        registry = {
          my-templates.flake = inputs.my-templates;
        };

        gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
          persistent = true;
        };

        settings = {
          auto-optimise-store = true;
          experimental-features = [
            "nix-command"
            "flakes"
            "ca-derivations"
          ];
          substituters = [
            "https://cache.nixos.org/"
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
      };
    };
}
