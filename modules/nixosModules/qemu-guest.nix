{ inputs, ... }:
{
  flake.nixosModules.qemu-guest = {
    imports = [
      "${inputs.nixpkgs}/nixos/modules/profiles/qemu-guest.nix"
    ];

    documentation.enable = false;
    documentation.nixos.enable = false;

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.system = "x86_64-linux";

    services.qemuGuest.enable = true;
    boot.loader.grub.enable = false;

    # nix flake check needs a dummy filesystem to pass
    fileSystems."/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
        graphics = true;
      };
    };
  };
}
