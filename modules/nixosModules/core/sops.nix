{ inputs, self, ... }:
{
  flake.nixosModules.core = {
    imports = [ inputs.sops-nix.nixosModules.sops ];

    sops = {
      defaultSopsFile = "${self}/secrets/common.yaml";
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      validateSopsFiles = false;

      secrets = {
        # Decrypt mocha-password to /run/secrets-for-user/ so it can be used to create the user
        "mocha-password".neededForUsers = true;
      };
    };
  };
}
