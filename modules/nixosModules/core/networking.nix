{
  flake.nixosModules.core = {
    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
      firewall.allowedTCPPorts = [
        22
        80
        443
      ];
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
        "8.8.8.8"
      ];
    };

    services.openssh.enable = true;
    services.openssh.settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      UseDns = true;
      # SSH should check the permissions of the identity files and directories
      StrictModes = true;
    };
  };
}
