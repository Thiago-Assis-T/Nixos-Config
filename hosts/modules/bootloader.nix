{...}: {
  boot = {
    plymouth.enable = true;
    loader = {
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
