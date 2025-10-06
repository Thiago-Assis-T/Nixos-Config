{pkgs, ...}: {
  security.sudo-rs.enable = true;
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
  ];
}
