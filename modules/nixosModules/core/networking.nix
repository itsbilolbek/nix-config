{
  flake.nixosModules.core = {
    networking = {
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
        "8.8.8.8"
      ];
      networkmanager.enable = true;
      firewall = {
        enable = true;
        allowedTCPPorts = [
          22
          80
          443
        ];
      };
    };

    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        UseDns = true;
        # SSH should check the permissions of the identity files and directories
        StrictModes = true;
      };
    };
  };
}
