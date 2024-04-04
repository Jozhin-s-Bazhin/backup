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
      name = "Fluent-Dark";
      package = pkgs.fluent-gtk-theme.override {
        tweaks = [ "round" ];
      };
    };

    iconTheme = {
      name = "adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    gtk3.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';

    gtk3.extraConfig.gtk-decoration-layout="menu:";
    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-theme=1
    '';
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
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
      "workspaces_follow_focus",
      "plug"
    ]
    plugin_paths = [
      "/home/roman/plug/"
    ]
  '';
}
