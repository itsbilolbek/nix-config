{
  flake.homeModules.helix = {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "gruvbox_light_hard";
        editor = {
          indent-guides.render = true;
          indent-guides.skip-levels = 1;
          file-picker.hidden = false;
          cursor-shape.insert = "bar";
          cursor-shape.select = "underline";
        };
      };
    };
  };
}
