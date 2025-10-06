{ ... }: {
  programs = {
    btop.enable = true;
    fastfetch = { enable = true; };
    bat.enable = true;
    fd.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        formatFile = ''
          curl -O https://raw.githubusercontent.com/torvalds/linux/refs/heads/master/.clang-format
        '';
      };
    };
    starship = {
      enable = true;
      enableBashIntegration = true;
    };
    nix-index = {
      enable = true;
      enableBashIntegration = true;
    };
    fzf = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
