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
        in
        {
          users.users.${username} = {
            isNormalUser = true;
            description = "${username}'s account";
            initialPassword = lib.mkDefault "12345";
            shell = pkgs.fish;
            extraGroups = [
              "networkmanager"
              "wheel"
            ];
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGEoLiI2EBrig34UzX2xY22+FK5JeYfUO5IqmyahjJSQ bilolbeknormuminov@gmail.com" # Xenon laptop
            ];
          };

          programs.fish.enable = true;
        };
    };
}
