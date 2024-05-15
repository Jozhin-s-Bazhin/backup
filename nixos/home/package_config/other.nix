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

    theme = {
      #enable = true;
      name = "Flat-Remix";
      package = pkgs.flat-remix-gtk;
    };

    iconTheme = {
      #enable = true;
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };

    /*gtk3.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';

    #gtk3.extraConfig.gtk-decoration-layout="menu:";
    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';*/
  };

  /*xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };*/

  #xdg.configFile."gtk-4.0".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/";

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
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
      "git.confirmSync" = false;
    };
    keybindings = [
      {
        "command" = "vscode-neovim.compositeEscape1";
        "key" = "j";
        "when" = "neovim.mode == insert && editorTextFocus";
        "args" = "j";
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
      "external:better_workspaces"
    ]
    plugins_paths = [
      "/etc/nixos/home/scripts/pypr"
    ]
  '';

  # KDEConnect
  services.kdeconnect.enable = true;
  services.kdeconnect.indicator = true;
}
