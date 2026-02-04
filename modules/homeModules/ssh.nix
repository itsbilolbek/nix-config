{ inputs, ... }:
let
  sshPath = "/home/mocha/.ssh/id_ed25519";
in
{
  flake.nixosModules.sops =
    { config, ... }:
    {
      sops.secrets = {
        "private-keys/mocha" = {
          path = sshPath;
          owner = config.users.users.mocha.name;
          inherit (config.users.users.mocha) group;
          mode = "0600";
        };
      };
    };

  flake.homeModules.ssh = {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];

    home.file.".ssh/id_ed25519.pub".text =
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEoLiI2EBrig34UzX2xY22+FK5JeYfUO5IqmyahjJSQ bilolbeknormuminov@gmail.com";

    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      matchBlocks = {
        "*" = { };
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = sshPath;
          addKeysToAgent = "yes";
        };
      };
    };

    services.ssh-agent.enable = true;
  };
}
