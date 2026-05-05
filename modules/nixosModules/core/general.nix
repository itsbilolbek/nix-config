{
  flake.nixosModules.core = {
    time.timeZone = "Asia/Seoul";

    services.xserver.xkb.options = "ctrl:nocaps";

    i18n.defaultLocale = "en_US.UTF-8";
  };
}
