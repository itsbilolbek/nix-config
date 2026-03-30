{
  flake.nixosModules.core = {
    time.timeZone = "Asia/Seoul";

    services.xserver.xkb.options = "ctrl:nocaps";

    i18n = {
      defaultLocale = "uz_UZ.UTF-8";
      extraLocales = [
        "uz_UZ.UTF-8/UTF-8"
        "en_US.UTF-8/UTF-8"
      ];
      supportedLocales = [
        "uz_UZ.UTF-8/UTF-8"
        "en_US.UTF-8/UTF-8"
      ];
    };
  };
}
