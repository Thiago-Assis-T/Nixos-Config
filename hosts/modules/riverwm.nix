{ pkgs, ... }: {
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
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
  };
}
