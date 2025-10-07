{ pkgs, ... }: {
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };
  users.users.thiago = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "seat"
      "sound"
      "power"
      "video"
      "render"
      "input"
      "networkmanager"
    ];
    packages = with pkgs; [ discord-canary git ];
  };
}
