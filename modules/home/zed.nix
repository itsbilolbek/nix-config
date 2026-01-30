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
      cursor_blink = false;
      disable_ai = false;
      collaboration_panel.button = false;
      buffer_line_height = "standard";
      autosave = "on_focus_change";
      theme = "Gruvbox Dark";
      icon_theme = "Colored Zed Icons Theme Dark";
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      ui_font_family = "JetBrainsMono Nerd Font";
      format_on_save = "on";
      tabs = {
        file_icons = true;
        git_status = true;
        show_diagnostics = "errors";
      };
      base_keymap = "VSCode";
      show_whitespaces = "boundary";
      minimap.show = "never";
      tab_size = 2;
      load_direnv = "shell_hook";
      inlay_hints = {
        enable = true;
        show_background = true;
      };

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
        C = {
          language_servers = [ "clangd" ];
        };

        "C++" = {
          language_servers = [ "clangd" ];
        };

        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };

        Python = {
          language_servers = [
            "pyright"
            "ruff"
          ];
          formatter.language_server.name = "ruff";
        };
      };
      lsp = {
        basedpyright.binary.path_lookup = true;
        clangd.binary.path_lookup = true;
        nixd.binary.path_lookup = true;
        ruff.binary.path_lookup = true;
      };
    };
  };
}
