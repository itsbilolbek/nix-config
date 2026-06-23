{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brightnessctl
      ];

      services = {
        printing.enable = true;
        pulseaudio.enable = false;

        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        libinput = {
          enable = true;
          touchpad.naturalScrolling = true;
          mouse = {
            # Disable mouse acceleration
            accelProfile = "flat";
            accelSpeed = "0";
          };
        };
      };

      security.rtkit.enable = true;
    };
}
