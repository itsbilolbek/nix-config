{ self, ... }:
{
  flake.nixosModules.gnome = { pkgs, lib, ... }: {
    specialisation.gnome.configuration = {
      imports = [ self.nixosModules.desktop ];

      # Turn off Cinnamon/LightDM
      services.xserver.desktopManager.cinnamon.enable = lib.mkForce false;
      services.xserver.displayManager.lightdm.enable = lib.mkForce false;

      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      programs.dconf.enable = true;

      # Force uzbek localization
      i18n.defaultLocale = lib.mkForce "uz_UZ.UTF-8";

      environment.systemPackages = with pkgs; [
        adwaita-icon-theme
        gnomeExtensions.dash-to-dock
      ];
    };
  };
}
