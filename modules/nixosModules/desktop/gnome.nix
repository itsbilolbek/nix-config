{ self, ... }:
{
  flake.nixosModules.gnome = { pkgs, ... }: {
    imports = [ self.nixosModules.desktop ];

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
    ];
  };
}
