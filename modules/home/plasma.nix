{
  programs.plasma = {
    enable = false;
    input.keyboard.options = ["compose:ralt"];
    overrideConfig = true;
    panels = [
      {
        location = "left";
        height = "48";
        floating = "false";
        opacity = "opaque";
        # widgets = [
        #   "org.kde.plasma.kickoff"
        #   "org.kde.plasma.pager"
        #   "org.kde.plasma.icontasks"
        #   "org.kde.plasma.marginsseparator"
        #   "org.kde.plasma.systemtray"
        #   "org.kde.plasma.digitalclock"
        #   "org.kde.plasma.showdesktop"
        # ];
      }
    ];
    workspace = {
      wallpaper = "${./foggy-forest-wallpaper.jpg}";
    };
  };
}
