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

        self.nixosModules.boot
        self.nixosModules.cinnamon
        self.nixosModules.fcitx
        self.nixosModules.fonts
        self.nixosModules.gaming
        self.nixosModules.home-manager
        self.nixosModules.i18n
        self.nixosModules.networking
        self.nixosModules.nix-settings
        self.nixosModules.virtualisation
        self.nixosModules.users
        self.nixosModules.xkb
      ];

      boot.initrd.kernelModules = [ "amdgpu" ];

      system.stateVersion = "25.11";

      networking.hostName = "xenon";

      services.openssh.enable = true;

      users.users.mocha.shell = pkgs.fish;

      programs.fish.enable = true;

      programs.nix-ld.enable = true;

      environment.systemPackages = [ pkgs.uv ];
    };
}
