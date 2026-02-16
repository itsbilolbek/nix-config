{
  flake.homeModules.helix =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.helix ];

      programs.helix = {
        enable = true;
        defaultEditor = true;
        settings = {
          theme = "solarized_light";
          editor = {
            indent-guides.render = true;
            indent-guides.skip-levels = 1;
            file-picker.hidden = false;
            cursor-shape.insert = "bar";
          };
        };
      };
    };
}
