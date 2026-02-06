{
  flake.nixosModules.e-imzo =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.e-imzo-manager ];

      services.e-imzo.enable = true;
    };
}
