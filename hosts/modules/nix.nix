{ ... }: {
  nixpkgs.config.allowUnfree = true;
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      randomizedDelaySec = "25min";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
