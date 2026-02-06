# Test VM server
{ inputs, self, ... }:
{
  flake.nixosConfigurations.argon = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostArgon
    ];
  };

  flake.nixosModules.hostArgon = [
    self.nixosModules.core
    self.nixosModules.usersMocha
    self.nixosModules.virtualisation
  ];

  networking.hostName = "argon";
  system.stateVersion = "25.11";

  documentation.enable = false;
  documentation.nixos.enable = false;

  nix.gc.options = "--delete-older-than 3d";

  programs.fish.enable = true;
}
