{
  flake.nixosModules.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.preferences = {
        user.name = lib.mkOption {
          type = lib.types.str;
          default = "mocha";
        };
      };

      config =
        let
          username = config.preferences.user.name;
          userPassword = "mocha-password";
        in
        {
          users.users.${username} = {
            isNormalUser = true;
            description = "${username}'s account";
            hashedPasswordFile = config.sops.secrets.${userPassword}.path;
            shell = pkgs.fish;
            extraGroups = [
              "networkmanager"
              "wheel"
              "podman"
            ];
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEoLiI2EBrig34UzX2xY22+FK5JeYfUO5IqmyahjJSQ bilolbeknormuminov@gmail.com" # Xenon laptop
            ];
          };

          programs.fish.enable = true;

          # Decrypt mocha-password to /run/secrets-for-user/ so it can be used to create the user
          sops.secrets.${userPassword}.neededForUsers = true;
          users.mutableUsers = false; # Required for password to be set via sops during system activation
        };
    };
}
