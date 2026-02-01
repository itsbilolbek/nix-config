{
  flake.nixosModules.boot = {
    boot = {
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
        systemd-boot.configurationLimit = 10;
        timeout = 3;
      };

      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
        "systemd.show_status=false"
      ];

      consoleLogLevel = 3;
      initrd.verbose = false;

      plymouth = {
        enable = true;
        theme = "spinner";
      };
    };
  };
}
