{ inputs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.bilolbek = {
      settings = {
        "layout.css.always_underline_links" = true;
        "sidebar.verticalTabs" = true;
        "browser.tabs.inTitlebar" = 1;
        "browser.toolbars.bookmarks.visibility" = "never";
      };

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        leechblock-ng
      ];
    };
  };
}
