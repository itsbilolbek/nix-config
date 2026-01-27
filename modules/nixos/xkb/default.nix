{
  services.xserver.xkb = {
    layout = "uzx,us";
    options = "ctrl:nocaps";
    extraLayouts.uzx = {
      description = "Uzbek (US)";
      languages = [ "uzb" ];
      symbolsFile = ./uz;
    };
  };
}
