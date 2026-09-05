{ darkTheme }:
{ pkgs, ... }: let
  colors = pkgs.callPackage ../../modules/colors { inherit darkTheme; };
in {

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.numix-cursor-theme;
    name = "Numix-Cursor";
    size = 24;
  };

  fonts.fontconfig = {
    enable = true;
    subpixelRendering = "rgb";
    hinting = "slight";
    defaultFonts = {
      serif = [ "DejaVu Serif" ];
      sansSerif = [ "Roboto" ];
      monospace = [ "Cascadia Code" ];
    };
  };

  home.packages = with pkgs; [
    dejavu_fonts
    noto-fonts
    noto-fonts-color-emoji
    roboto
    liberation_ttf
    cascadia-code
    material-symbols
    powerline-symbols
    adwaita-icon-theme
    papirus-icon-theme
    numix-cursor-theme
  ];

  gtk = {
    enable = true;

    iconTheme.name = "Papirus";

    gtk3.theme.name = if darkTheme then "Adwaita-dark" else "Adwaita";
    gtk2.theme.name = if darkTheme then "Adwaita-dark" else "Adwaita";
    gtk2.theme.package = pkgs.gnome-themes-extra;

    font = {
      name = "Roboto";
      size = 10.5;
    };

    gtk3.extraCss = ''
      window, .titlebar, headerbar, decoration {
      	border-radius: 0;
      	box-shadow: none;
      }
    '';
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = if darkTheme then "prefer-dark" else "prefer-light";
      accent-color = "teal";
    };
    "org/gnome/desktop/a11y/applications" = {
      screen-keyboard-enabled = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "";
    };
  };

  qt.platformTheme.name = "gtk3";

  programs.foot.settings = {
    main = {
      font = "Cascadia Code:size=10";
      line-height = "13";
      pad = "10x10";
      dpi-aware = "no";
    };
    colors-dark = colors.foot;
  };

  services.mako.settings = {
    text-color = "${colors.alacritty.primary.foreground}";
    border-color = "${colors.alacritty.primary.foreground}";
    background-color = "${colors.alacritty.primary.background}";
    border-size = 2;
    border-radius = 4;
    width = 400;
    height = 200;
    padding = "20";
    margin = "20";
  };

  programs.fuzzel.settings = {
    main = {
      icon-theme = if darkTheme then "Papirus-Dark" else "Papirus";
      font = "DejaVu Sans Mono";
      use-bold = true;
    };
    colors = colors.fuzzel;
  };

  programs.helix.settings.theme = if darkTheme then "tokyonight_moon" else "cyan_light";

}
