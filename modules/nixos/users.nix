{
  flake.nixosModules.users = {
    users.users.mocha = {
      isNormalUser = true;
      description = "Bilolbek Normuminov";
      extraGroups = [
        "networkmanager"
        "wheel"
        "podman"
      ];
    };
  };
}
