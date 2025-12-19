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
      disable_ai = true;
      telemetry.metrics = false;
      telemetry.diagnostics = false;
      collaboration_panel.dock = "right";
      collaboration_panel.button = false;
      git_panel.dock = "right";
      outline_panel.dock = "right";
      project_panel.dock = "right";
      buffer_line_height = "standard";
      autosave = "on_focus_change";
      formate_on_save = "on";
      tabs = {
        file_icons = true;
        git_status = true;
        show_diagnostics = "errors";
      };
      base_keymap = "VSCode";
      show_whitespaces = "boundary";
      minimap.show = "auto";

      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter = {
            external = {
              command = "alejandra";
              arguments = ["--quiet" "-"];
            };
          };
        };
      };
    };
  };
}
