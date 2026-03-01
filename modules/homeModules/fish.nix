{
  flake.homeModules.fish =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        # copy and paste in terminal
        wl-clipboard
        xclip
      ];

      home.sessionVariables = {
        "_ZO_ECHO" = "1"; # print directory before jumping to it
      };

      programs.starship = {
        enable = true;
      };

      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        options = [ "--cmd cd" ];
      };

      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          set fish_greeting # Disable greeting
        '';

        shellAliases = {
          cat = "bat";
          conf = "cd ${config.home.homeDirectory}/nix-config && hx .";
          grep = "grep --color=auto";
          ll = "eza -Alh --no-quotes --git --icons=auto --group-directories-first";
          ls = "eza";
          less = "bat -p";
          tree = "eza --tree";
          cp = "cp -ivr";
          rm = "rm -Ivr";
          mv = "mv -iv";
          mkdir = "mkdir -pv";
        };

        shellAbbrs = {
          tempd = "cd (mktemp -d)";
          cdp = {
            setCursor = "%";
            expansion = "cd ~/Projects/%";
          };

          # nix abbreviations
          nfc = "nix flake check";
          ns = {
            setCursor = "%";
            expansion = "nix shell nixpkgs#%";
          };
          nr = {
            setCursor = "%";
            expansion = "nix run nixpkgs#%";
          };

          # git abbreviations
          g = "git";
          gcl = "git clone";
          ga = "git add -A";
          gb = "git branch";
          gco = "git checkout";
          gs = "git status -s";
          gg = "git graph";
          ginit = "git init && git add -A && git commit -m \"Initial commit\"";
          gc = {
            setCursor = "%";
            expansion = "git commit -m \"%\"";
          };
          gca = {
            setCursor = "%";
            expansion = "git commit -am \"%\"";
          };
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
