{
  programs.zed-editor = {
    enable = true;

    userSettings = {
      disable_ai = true;
      telemetry.metrics = false;
      telemetry.diagnostics = false;
      collaboration_panel.dock = "right";
      git_panel.dock = "right";
      outline_panel.dock = "right";
      project_panel.dock = "right";
      buffer_line_height = "standard";
      autosave.after_delay.milliseconds = 1000;
      base_keymap = "VSCode";
      show_whitespaces = "boundary";
      minimap.show = "auto";
    };
  };
}
