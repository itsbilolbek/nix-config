{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "env"
      "html"
      "ini"
      "nix"
      "toml"
    ];

    userSettings = {
      auto_update = false;
      cursor_blink = false;
      disable_ai = false;
      telemetry.metrics = false;
      telemetry.diagnostics = false;
      collaboration_panel.button = false;
      buffer_line_height = "standard";
      autosave = "on_focus_change";
      theme = "Gruvbox Dark";
      icon_theme = "Colored Zed Icons Theme Dark";
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      ui_font_family = "JetBrainsMono Nerd Font";
      formate_on_save = "on";
      tabs = {
        file_icons = true;
        git_status = true;
        show_diagnostics = "errors";
      };
      base_keymap = "VSCode";
      show_whitespaces = "boundary";
      minimap.show = "never";

      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter = {
            external = {
              command = "alejandra";
              arguments = [
                "--quiet"
                "-"
              ];
            };
          };
        };
      };
    };
  };
}
