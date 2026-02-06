{
  flake.nixosModules.uzbekl10n = {
    services.xserver.xkb = {
      layout = "uzx,us";
      options = "ctrl:nocaps";
      extraLayouts.uzx = {
        description = "Uzbek (US)";
        languages = [ "uzb" ];
        symbolsFile = ./uz_us.xkb;
      };
    };

    i18n.extraLocales = [ "uz_UZ.UTF-8/UTF-8" ];
    i18n.supportedLocales = [ "uz_UZ.UTF-8/UTF-8" ];
  };
}
