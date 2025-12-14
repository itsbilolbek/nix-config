{
  programs.zed-editor = {
    enable = true;

    userSettings = {
      disable_ai = true;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };
  };
}
