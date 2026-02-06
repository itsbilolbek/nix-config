{
  flake.nixosModules.plymouth = {
    boot = {
      loader.systemd-boot.configurationLimit = 10;
      loader.timeout = 3;
      consoleLogLevel = 3;
      initrd.verbose = false;

      plymouth.enable = true;
      plymouth.theme = "spinner";

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
    };
  };
}
