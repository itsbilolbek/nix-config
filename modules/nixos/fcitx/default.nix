{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = false;
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-hangul
      ];
    };
  };
}
