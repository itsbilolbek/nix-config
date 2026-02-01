{
  flake.nixosModules.gaming =
    { pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "amdgpu" ];

      hardware.graphics.enable = true;

      environment.systemPackages = with pkgs; [
        mangohud
      ];

      programs.gamemode.enable = true;
      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
      };
    };
}
