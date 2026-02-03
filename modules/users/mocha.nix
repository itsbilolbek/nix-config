{
  flake.nixosModules.usersMocha =
    { config, pkgs, ... }:
    {
      users.users.mocha = {
        isNormalUser = true;
        description = "Bilolbek Normuminov";
        hashedPasswordFile = config.sops.secrets.mocha-password.path;
        shell = pkgs.fish;
        extraGroups = [
          "networkmanager"
          "wheel"
          "podman"
        ];
      };

      # Decrypt mocha-password to /run/secrets-for-user/ so it can be used to create the user
      sops.secrets.mocha-password.neededForUsers = true;
      users.mutableUsers = false; # Required for password to be set via sops during system activation
    };
}
