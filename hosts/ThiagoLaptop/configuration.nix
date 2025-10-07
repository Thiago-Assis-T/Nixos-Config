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
    ../modules/powerManagement.nix
    ../modules/rustRewrites.nix
    ../modules/neovim.nix
    ../modules/nix.nix
    ../modules/btrfs.nix
    ../modules/podman.nix
  ];

  networking.hostName = "ThiagoLaptop"; # Define your hostname.
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.enable = true;

  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  system.stateVersion = "25.05"; # Did you read the comment?
}
