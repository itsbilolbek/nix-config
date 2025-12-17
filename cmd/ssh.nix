{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {};
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        addKeysToAgent = "yes";
      };
    };
    extraConfig = ''
      Include ~/.ssh/config_private
    '';
  };


  services.ssh-agent.enable = true;
}
