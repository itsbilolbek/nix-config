{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.btop =
        let
          conf = pkgs.writeText "btop.conf" ''
            net_auto = False
            net_download = 10
            net_upload = 1
          '';
        in
        inputs.wrappers.lib.wrapPackage {
          inherit pkgs;
          package = pkgs.btop;
          flags = {
            "-c" = "${conf}";
          };
        };
    };
}
