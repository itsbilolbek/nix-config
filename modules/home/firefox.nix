{
  flake.homeModules.firefox =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.firefox ];

      programs.firefox = {
        enable = true;

        profiles.bilolbek = {
          settings = {
            "layout.css.always_underline_links" = true;
            "sidebar.verticalTabs" = true;
            "browser.tabs.inTitlebar" = 1;
            "browser.toolbars.bookmarks.visibility" = "never";
          };
        };
      };
    };
}
