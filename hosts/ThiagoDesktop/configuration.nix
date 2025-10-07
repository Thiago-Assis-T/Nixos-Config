{ ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../modules/riverwm.nix
    ../modules/seatd.nix
    ../modules/user.nix
    ../modules/locales.nix
    ../modules/bootloader.nix
    ../modules/loginManager.nix
    #../modules/powerManagement.nix
    ../modules/rustRewrites.nix
    ../modules/neovim.nix
    ../modules/nix.nix
    ../modules/btrfs.nix
    ../modules/steam.nix
    ../modules/podman.nix
  ];

  networking.hostName = "ThiagoDesktop"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  services.openssh.enable = true;
  system.stateVersion = "25.05"; # Did you read the comment?
}
