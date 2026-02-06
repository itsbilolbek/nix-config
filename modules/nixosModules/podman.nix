{
  flake.nixosModules.podman =
    { config, pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.podman-compose ];

      users.users.${config.preferences.user.name}.extraGroups = [
        "podman"
      ];

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
