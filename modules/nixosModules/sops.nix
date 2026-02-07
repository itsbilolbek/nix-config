{ inputs, self, ... }:
{
  flake.nixosModules.sops =
    { config, lib, ... }:
    let
      username = config.preferences.user.name;
      userPassword = "mocha-password";
    in
    {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        defaultSopsFile = "${self}/secrets/common.yaml";
        age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
        validateSopsFiles = false;

        secrets = {
          # Decrypt mocha-password to /run/secrets-for-user/ so it can be used to create the user
          "${userPassword}".neededForUsers = true;
        };
      };

      # Required for password to be set via sops during system activation
      users.mutableUsers = false;
      users.users.${username} = {
        initialPassword = lib.mkForce null;
        hashedPasswordFile = config.sops.secrets."${userPassword}".path;
      };
    };
}
