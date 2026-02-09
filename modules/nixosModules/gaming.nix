{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "amdgpu" ];

      environment.systemPackages = with pkgs; [
        mumble
      ];

      hardware.graphics.enable = true;

      programs.gamemode.enable = true;
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        protontricks.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        extraPackages = with pkgs; [
          mangohud
        ];
      };
    };
}
