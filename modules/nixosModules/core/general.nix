{
  flake.nixosModules.core = {
    time.timeZone = "Asia/Tashkent";

    services.xserver.xkb.options = "ctrl:nocaps";

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocales = [ "en_US.UTF-8/UTF-8" ];
      supportedLocales = [ "en_US.UTF-8/UTF-8" ];
    };
  };
}
