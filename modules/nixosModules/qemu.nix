{
  flake.nixosModules.qemu =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qemu
        quickemu
      ];
      virtualisation.libvirtd.enable = true;
      programs.virt-manager.enable = true;

      users.users.${config.preferences.user.name}.extraGroups = [
        "libvirtd"
        "kvm"
      ];
    };
}
