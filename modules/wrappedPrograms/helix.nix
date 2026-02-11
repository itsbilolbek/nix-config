{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.helix =
        (inputs.wrappers.wrapperModules.helix.apply {
          inherit pkgs;
          settings = {
            theme = "catppuccin_mocha";
          };
        }).wrapper;
    };
}
