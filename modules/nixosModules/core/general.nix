{
  flake.nixosModules.core =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        helix
      ];

      time.timeZone = "Asia/Tashkent";

      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [ "en_US.UTF-8/UTF-8" ];
        supportedLocales = [ "en_US.UTF-8/UTF-8" ];
      };
    };
}
