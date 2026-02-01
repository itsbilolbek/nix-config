{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts = {
        fontconfig = {
          defaultFonts = {
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
        };

        packages = with pkgs; [
          nanum # Classic Korean fonts (Gothic, Myeongjo, Pen, Brush)
          noto-fonts-cjk-sans # Google's high-quality CJK fonts
          noto-fonts-cjk-serif
          baekmuk-ttf # Older but standard compatibility fonts
        ];
      };
    };
}
