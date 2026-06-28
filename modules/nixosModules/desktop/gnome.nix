{ self, ... }:
{
  flake.nixosModules.gnome = { pkgs, ... }: {
    imports = [ self.nixosModules.desktop ];

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
    ];
  };
}
