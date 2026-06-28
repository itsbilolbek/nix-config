{
  flake.nixosModules.uzbekl10n = _: {
    i18n.extraLocales = [ "uz_UZ.UTF-8/UTF-8" ];

    services.xserver.xkb = {
      layout = "uzx,us";
      options = "ctrl:nocaps";
      extraLayouts.uzx = {
        description = "Uzbek (US)";
        languages = [ "uzb" ];
        symbolsFile = ./uz_us.xkb;
      };
    };
  };
}
