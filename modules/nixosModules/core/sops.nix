{ inputs, self, ... }:
{
  flake.nixosModules.core = {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    sops = {
      defaultSopsFile = "${self}/secrets/common.yaml";
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      validateSopsFiles = false;

      secrets = {
        "mocha-password" = { };
      };
    };
  };
}
