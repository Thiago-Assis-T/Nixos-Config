{...}: {
  powerManagement = {
    powertop.enable = true;
    enable = true;
  };
  services = {
    thermald.enable = true;
    power-profiles-daemon.enable = true;
    system76-scheduler = {
      enable = true;
      useStockConfig = true;
    };
    scx = {
      enable = true;
      scheduler = "scx_bpfland";
      extraArgs = ["-f" "-p" "-k" "--primary-domain" "powersave"];
    };
  };
}
