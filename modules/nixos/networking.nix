{
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
}
