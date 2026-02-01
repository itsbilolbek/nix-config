{
  flake.nixosModules.virtualisation =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.podman-compose ];

      virtualisation = {
        containers = {
          registries.search = [
            "docker.io"
            "quay.io"
            "ghcr.io"
          ];
          storage.settings = {
            storage.driver = "overlay";
          };
        };
        podman = {
          enable = true;
          dockerSocket.enable = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };
    };
}
