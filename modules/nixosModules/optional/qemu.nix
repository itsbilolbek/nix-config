{
  flake.nixosModules.qemu =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qemu
        quickemu
      ];
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;

      users.users.mocha.extraGroups = [
        "libvirtd"
        "kvm"
      ];
    };
}
