{ pkgs, ... }: {
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
  };
  services.xserver.xkb = {
    layout = "br";
    variant = "abnt2";
  };
  programs.river = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [ foot firefox ];
  };
  fonts = {
    enableDefaultPackages = true;
    fontconfig.useEmbeddedBitmaps = true;
    fontDir.enable = true;
    packages = with pkgs; [ nerd-fonts.shure-tech-mono ];
  };
  programs.waybar.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
  };
}
