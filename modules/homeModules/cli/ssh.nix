{ inputs, self, ... }:
{
  flake.homeModules.cli =
    { config, ... }:
    let
      githubSshKeyName = "github-ssh";
      inherit (config.home) homeDirectory;
    in
    {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];

      sops = {
        age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
        defaultSopsFile = "${self}/secrets/admin.yaml";
        secrets.${githubSshKeyName} = {
          path = "${homeDirectory}/.ssh/id_ed25519";
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
            identityFile = config.sops.secrets.${githubSshKeyName}.path;
            addKeysToAgent = "yes";
          };
        };
      };

      services.ssh-agent.enable = true;
    };
}
