{ inputs, self, ... }:
{
  flake.nixosConfigurations.xenon = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs self; };

    modules = [
      self.nixosModules.hostXenon
    ];
  };

  flake.nixosModules.hostXenon =
    { pkgs, ... }:
    {
      imports = [
        inputs.stylix.nixosModules.stylix

        self.nixosModules.cinnamon
        self.nixosModules.core
        self.nixosModules.fcitx
        self.nixosModules.gaming
        self.nixosModules.home-manager
        self.nixosModules.virtualisation
        self.nixosModules.usersMocha
      ];

      boot.initrd.kernelModules = [ "amdgpu" ];

      system.stateVersion = "25.11";

      networking.hostName = "xenon";

      services.openssh.enable = true;

      programs.fish.enable = true;

      programs.nix-ld.enable = true;

      environment.systemPackages = [ pkgs.uv ];
    };
}
