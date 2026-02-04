{ inputs, ... }:
{
  flake.homeModules.ssh =
    { config, ... }:
    let
      sshPath = "${config.home.homeDirectory}/.ssh/id_ed25519";
    in
    {
      imports = [
        inputs.sops-nix.homeManagerModules.sops
      ];

      sops = {
        age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
        defaultSopsFile = "${inputs.my-secrets}/secrets.yaml";
        secrets."private-keys/mocha" = {
          path = sshPath;
        };
      };

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
