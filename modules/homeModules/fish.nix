{
  flake.homeModules.fish =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        fish

        # copy and paste in terminal
        wl-clipboard
        xclip
      ];

      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          set fish_greeting # Disable greeting
          fish_config prompt choose astronaut
        '';

        shellAliases = {
          cat = "bat";
          conf = "cd ${config.home.homeDirectory}/nix-config && hx .";
          grep = "grep --color=auto";
          ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
          ls = "eza";
          tree = "eza --tree";
          cp = "cp -ivr";
          rm = "rm -Ivr";
          mv = "mv -iv";
          mkdir = "mkdir -pv";
        };

        shellAbbrs = {
          tempd = "cd (mktemp -d)";

          # git abbreviations
          ga = "git add -A";
          gb = "git branch";
          gc = "git commit -m";
          gco = "git checkout";
          gca = "git commit -am";
          gs = "git status -s";
          gg = "git graph";
          ginit = "git init && git add -A && git commit -m \"Initial commit\"";
        };

        functions = {
          mkcd.body = "mkdir -pv $argv; and cd $argv";
          template.body = "nix flake init -t github:itsbilolbek/flake-templates#\"$argv\" && direnv allow";
          cb.body = ''
            if isatty stdin
              # Paste logic: Try wayland first, then X11
              if set -q WAYLAND_DISPLAY; wl-paste; else; xclip -selection clipboard -o; end
            else
              # Copy logic: Read from stdin and send to clipboard
              if set -q WAYLAND_DISPLAY; wl-copy; else; xclip -selection clipboard; end
            end
          '';
        };
      };
    };
}
