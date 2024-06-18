{ lib, config, pkgs, ... }:
let 
  colors = import ./variables/colors.nix { inherit lib; };
in
{
  # GTK
  gtk = { 
    enable = true; 
    font = {
      name = "Ubuntu Nerd Font";
      size = 11;
    };

/*    iconTheme = {
      name = "Tela-circle";
      package = pkgs.tela-circle-icon-theme;
    };*/
  };

  # Gtk theme
  home.file.".themes/Flat-Remix/".source = "${pkgs.flat-remix-gtk}/share/themes/Flat-Remix-GTK-Blue-Dark/";
  xdg.configFile = {
    "gtk-4.0/assets".source = "${pkgs.flat-remix-gtk}/share/themes/Flat-Remix/LibAdwaita-Blue-Dark/assets";
    "gtk-4.0/gtk.css".source = "${pkgs.flat-remix-gtk}/share/themes/Flat-Remix/LibAdwaita-Blue-Dark/gtk.css";
  };
  xdg.configFile."environment.d/envvars.conf".text = ''
    GTK_THEME=Flat-Remix
    XCURSOR_SIZE=24
    HYPRCURSOR_SIZE=24
  '';

  dconf = {
    enable = true;
    #settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/desktop/interface".gtk-theme = "Flat-Remix";
  };

  # QT
  qt = {
    enable = true;
    platformTheme.name = "gtk2";
    style.name = "gtk2";
  };

  # Cursor
  home.pointerCursor = {
    package = pkgs.gnome.adwaita-icon-theme;
    gtk.enable = true;
    name = "Adwaita";
    size = 24;
    x11.enable = true;
  };

  # Kitty
  programs.kitty = {
    enable = true;
    settings = {
      background = "#${colors.nixToHex colors.background_darker}";
      background_opacity = toString colors.opacity;
      confirm_os_window_close = "0";
      window_padding_width = "3";
      font_family = "UbuntuMono Nerd Font";
      font_size = "13.0";
      enable_audio_bell = "no";
      hide_window_decorations = "yes";
    };
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Jozhin-s-Bazhin";
    userEmail = "rbezroutchko@gmail.com";
  };

  # VSCode
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      ms-python.python
      ms-python.vscode-pylance
      jnoortheen.nix-ide
    ];
    userSettings = {
      vscode-neovim.neovimExecutablePaths.linux = "${pkgs.neovim}/bin/nvim";
      extensions.experimental.affinity."asvetliakov.vscode-neovim" = 1;
      "window.titleBarStyle" = "native";
      "git.confirmSync" = false;
    };
    keybindings = [
      {
        "\"jk\": { \"command\": \"vscode-neovim.escape\" }" 
      }
      {
        "command" = "vscode-neovim.compositeEscape2";
        "key" = "k";
        "when" = "neovim.mode == insert && editorTextFocus";
        "args" = "k";
      }
    ];
  };

  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "external:better_workspaces",
      "external:ags_tools"
    ]
    plugins_paths = [
      "/etc/nixos/home/scripts/pypr"
    ]
  '';

  # KDEConnect
  services.kdeconnect.enable = true;
  services.kdeconnect.indicator = true;
}
