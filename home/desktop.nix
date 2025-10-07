{ pkgs, ... }: {
  imports = [
    ./modules/river.nix
    ./modules/waybar.nix
    ./modules/git.nix
    ./modules/shell.nix
  ];

  home = {
    username = "thiago";
    homeDirectory = "/home/thiago";
    stateVersion = "23.11";
    packages = with pkgs; [ fastfetch ];
  };
}
