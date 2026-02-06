{
  flake.nixosModules.koreanIME =
    { pkgs, ... }:
    {
      i18n.extraLocales = [ "ko_KR.UTF-8/UTF-8" ];
      i18n.supportedLocales = [ "ko_KR.UTF-8/UTF-8" ];

      fonts.fontconfig.defaultFonts = {
        serif = [
          "Noto Serif CJK KR"
          "NanumMyeongjo"
        ];
        sansSerif = [
          "Noto Sans CJK KR"
          "NanumGothic"
        ];
        monospace = [
          "Noto Sans Mono CJK KR"
          "NanumGothicCoding"
        ];
      };

      fonts.packages = with pkgs; [
        nanum # Classic Korean fonts (Gothic, Myeongjo, Pen, Brush)
        noto-fonts-cjk-sans # Google's high-quality CJK fonts
        noto-fonts-cjk-serif
        baekmuk-ttf # Older but standard compatibility fonts
      ];

      i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.waylandFrontend = false;
        fcitx5.addons = with pkgs; [
          fcitx5-gtk
          fcitx5-hangul
        ];
      };
    };
}
