{
  flake.homeModules.cli =
    { config, ... }:
    {
      home.sessionVariables = {
        "NH_FLAKE" = "${config.home.homeDirectory}/nix-config";
      };

      programs.nh.enable = true;
    };
}
