{
  flake.nixosModules.usersMocha =
    { config, pkgs, ... }:
    {
      users.users.${config.preferences.user.name} = {
        isNormalUser = true;
        description = "${config.preferences.user.name}'s account";
        hashedPasswordFile = config.sops.secrets.mocha-password.path;
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

      # Decrypt mocha-password to /run/secrets-for-user/ so it can be used to create the user
      sops.secrets.mocha-password.neededForUsers = true;
      users.mutableUsers = false; # Required for password to be set via sops during system activation
    };
}
