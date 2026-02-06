{
  flake.homeModules.firefox =
    { pkgs, username, ... }:
    {
      home.packages = [ pkgs.firefox ];

      programs.firefox.enable = true;
      programs.firefox.profiles.${username}.settings = {
        "layout.css.always_underline_links" = true;
        "sidebar.verticalTabs" = true;
        "browser.tabs.inTitlebar" = 1;
        "browser.toolbars.bookmarks.visibility" = "never";
      };
    };
}
