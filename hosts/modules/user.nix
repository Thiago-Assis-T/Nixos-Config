{ pkgs, ... }: {
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };
  users.users.thiago = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "seat" "wheel" "video" "render" ];
    packages = with pkgs; [ git ];
  };
}
