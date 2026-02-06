{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
    inputs.git-hooks.flakeModule
  ];

  perSystem =
    {
      config,
      pkgs,
      ...
    }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        settings.global.excludes = [
          "secrets/*.yaml"
          "flake.lock"
        ];
        programs = {
          nixfmt.enable = true;
          prettier.enable = true;
          statix.enable = true;
          deadnix.enable = true;
          yamlfmt.enable = true;
          taplo.enable = true;
        };
      };

      pre-commit = {
        check.enable = true;
        settings.excludes = [
          "^secrets/.*"
          "flake.lock"
        ];
        settings.hooks = {
          treefmt.enable = true;
          end-of-file-fixer.enable = true;
          trim-trailing-whitespace.enable = true;
        };
      };

      devShells.default = pkgs.mkShell {
        shellHook = config.pre-commit.installationScript;

        nativeBuildInputs = with pkgs; [
          config.treefmt.build.wrapper
          nixd
          just
          sops
        ];
      };
    };
}
