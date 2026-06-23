{
  flake.homeModules.firefox =
    { config, username, ... }:
    {
      programs.firefox.enable = true;
      programs.firefox.configPath = "${config.xdg.configHome}/mozilla/firefox";
      programs.firefox.profiles.${username}.settings = {
        "layout.css.always_underline_links" = true;
        "sidebar.verticalTabs" = true;
        "browser.tabs.inTitlebar" = 1;
        "browser.toolbars.bookmarks.visibility" = "never";
      };
    };
}
