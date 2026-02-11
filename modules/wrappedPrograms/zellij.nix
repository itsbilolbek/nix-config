{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.zellij =
        let
          conf = pkgs.writeText "config.kdl" ''
            default_mode "locked"
            keybinds {
              shared_except "tmux" {
                bind "Alt 1" {
                  GoToTab 1
                }
                bind "Alt 2" {
                  GoToTab 2
                }
                bind "Alt 3" {
                  GoToTab 3
                }
                bind "Alt 4" {
                  GoToTab 4
                }
                bind "Alt 5" {
                  GoToTab 5
                }
                bind "Alt 6" {
                  GoToTab 6
                }
                bind "Alt 7" {
                  GoToTab 7
                }
                bind "Alt 8" {
                  GoToTab 8
                }
                bind "Alt 9" {
                  GoToTab 9
                }
              }
            }
            pane_frames false
            show_startup_tips false
            theme "catppuccin-macchiato"
          '';
        in
        inputs.wrappers.lib.wrapPackage {
          inherit pkgs;
          package = pkgs.zellij;
          flags = {
            "-c" = "${conf}";
          };
        };
    };
}
