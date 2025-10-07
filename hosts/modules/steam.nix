{ pkgs, ... }: {
  hardware.xone.enable = true;
  environment = { systemPackages = with pkgs; [ mangohud ]; };
  programs.java.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  programs = {
    steam = {
      extraPackages = [ pkgs.jdk ];
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall =
        true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
