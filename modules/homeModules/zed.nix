{
  flake.homeModules.zed =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.zed ];

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
          autosave = "on_focus_change";
          base_keymap = "VSCode";
          disable_ai = false;
          format_on_save = "on";
          load_direnv = "shell_hook";

          # Appearance
          buffer_line_height = "standard";
          collaboration_panel.button = false;
          cursor_blink = false;
          icon_theme = "Colored Zed Icons Theme Dark";
          inlay_hints.enable = true;
          inlay_hints.show_background = true;
          minimap.show = "never";
          show_whitespaces = "boundary";
          tab_size = 2;
          theme = "Catppuccin Mocha";
          title_bar.show_sign_in = false;
          title_bar.show_branch_icon = true;
          buffer_font_family = "JetBrainsMono Nerd Font Mono";
          ui_font_family = "JetBrainsMono Nerd Font";

          tabs = {
            file_icons = true;
            git_status = true;
            show_diagnostics = "errors";
          };

          # Formatters and LSPs
          external_formatter = {
            command = "nix";
            arguments = [
              "fmt"
              "--"
              "--stdin"
              "{buffer_path}"
            ];
          };

          languages = {
            C.language_servers = [ "clangd" ];
            "C++".language_servers = [ "clangd" ];

            Nix.language_servers = [
              "nixd"
              "!nil"
            ];

            Python.formatter.language_server.name = "ruff";
            Python.language_servers = [
              "pyright"
              "ruff"
            ];
          };

          lsp = {
            basedpyright.binary.path_lookup = true;
            clangd.binary.path_lookup = true;
            nixd.binary.path_lookup = true;
            ruff.binary.path_lookup = true;
          };
        };
      };
    };
}
