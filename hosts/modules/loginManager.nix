{...}: {
  programs.regreet = {
    enable = true;
    theme.name = "Adwaita-Dark";
    settings = {
      #background = {
      #  path = inputs.wallpaper;
      #  fit = "Fill";
      #};
    };
  };
}
