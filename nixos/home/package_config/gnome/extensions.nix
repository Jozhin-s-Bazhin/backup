{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"blur-my-shell@aunetx"
	"switch-workspaces-on-active-monitor@gnome-shell-extension-simulate-switching-workspaces-on-active-monitor.micheledaros.github.com"
	"forge@jmmaranan.com"
	"native-window-placement@gnome-shell-extensions.gcampax.github.com"
	"drive-menu@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    # Focus follows mouse
    #"/org/gnome/desktop/wm/preferences".focus-mode = "sloppy";

    # Themes
    "/org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix";
    };
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  /*
  # Forge settings
  xdg.configFile = {
    
  "forge/config/windows.json".text = ''
    {
        "overrides": [
            {
                "wmClass": "org.gnome.Shell.Extensions",
                "wmTitle": "Forge Settings",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-toolbox",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-goland",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-webstorm",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-phpstorm",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-datagrip",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-rubymine",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "jetbrains-idea",
                "wmTitle": "splash",
                "mode": "float"
            },
            {
                "wmClass": "Com.github.amezin.ddterm",
                "mode": "float"
            },
            {
                "wmClass": "Com.github.donadigo.eddy",
                "mode": "float"
            },
            {
                "wmClass": "Conky",
                "mode": "float"
            },
            {
                "wmClass": "Gnome-initial-setup",
                "mode": "float"
            },
            {
                "wmClass": "gnome-terminal-server",
                "wmTitle": "Preferences – General",
                "mode": "float"
            },
            {
                "wmClass": "gnome-terminal-preferences",
                "mode": "float"
            },
            {
                "wmClass": "Guake",
                "mode": "float"
            },
            {
                "wmClass": "zoom",
                "mode": "float"
            },
            {
                "wmClass": "firefox",
                "wmTitle": "About Mozilla Firefox",
                "mode": "float"
            },
            {
                "wmClass": "firefox",
                "wmTitle": "!Mozilla Firefox",
                "mode": "float"
            },
            {
                "wmClass": "org.mozilla.firefox.desktop",
                "wmTitle": "About Mozilla Firefox",
                "mode": "float"
            },
            {
                "wmClass": "org.mozilla.firefox.desktop",
                "wmTitle": "!Mozilla Firefox",
                "mode": "float"
            },
            {
                "wmClass": "thunderbird",
                "wmTitle": "About Mozilla Thunderbird",
                "mode": "float"
            },
            {
                "wmClass": "thunderbird",
                "wmTitle": "!Mozilla Thunderbird",
                "mode": "float"
            },
            {
                "wmClass": "org.mozilla.Thunderbird.desktop",
                "wmTitle": "About Mozilla Thunderbird",
                "mode": "float"
            },
            {
                "wmClass": "org.mozilla.Thunderbird.desktop",
                "wmTitle": "!Mozilla Thunderbird",
                "mode": "float"
            }
        ]
    }
  '';
  "forge/stylesheet/forge/stylesheet.css".text = ''
    .tiled {
    color: rgba(6, 108, 250, 1);
    opacity: 1;
    border-width: 3px;
    }

    .split {
    color: rgba(6, 108, 250, 1);
    opacity: 1;
    border-width: 3px;
    }

    .stacked {
    color: ;
    opacity: 1;
    border-width: 3px;
    }

    .tabbed {
    color: rgba(6, 108, 250, 1);
    opacity: 1;
    border-width: 3px;
    }

    .floated {
    color: rgba(6, 108, 250, 1);
    border-width: 3px;
    opacity: 1;
    }

    .window-tiled-border {
    border-width: 3px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    }

    .window-split-border {
    border-width: 3px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    }

    .window-split-horizontal {
    border-left-width: 0;
    border-top-width: 0;
    border-bottom-width: 0;
    }

    .window-split-vertical {
    border-left-width: 0;
    border-top-width: 0;
    border-right-width: 0;
    }

    .window-stacked-border {
    border-width: 3px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    }

    .window-tabbed-border {
    border-width: 3px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    }

    .window-tabbed-bg {
    border-radius: 8px;
    }

    .window-tabbed-tab {
    background-color: rgba(6, 108, 250, 1);
    border-color: rgba(6, 108, 250, 1);
    border-width: 1px;
    border-radius: 8px;
    color: white;
    margin: 1px;
    box-shadow: 0 0 0 1px rgba(6, 108, 250, 1);
    }

    .window-tabbed-tab-active {
    background-color: rgba(6, 108, 250, 1);
    color: black;
    box-shadow: 0 0 0 1px rgba(6, 108, 250, 1);
    }

    .window-tabbed-tab-close {
    padding: 3px;
    margin: 4px;
    border-radius: 16px;
    width: 16px;
    background-color: #e06666;
    }

    .window-tabbed-tab-icon {
    margin: 3px;
    }

    .window-floated-border {
    border-width: 3px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    }

    .window-tilepreview-tiled {
    border-width: 1px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    background-color: rgba(6, 108, 250, 1);
    }

    .window-tilepreview-stacked {
    border-width: 1px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    background-color: rgba(6, 108, 250, 1);
    }

    .window-tilepreview-swap {
    border-width: 1px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    background-color: rgba(6, 108, 250, 1);
    }

    .window-tilepreview-tabbed {
    border-width: 1px;
    border-color: rgba(6, 108, 250, 1);
    border-style: solid;
    border-radius: 14px;
    background-color: rgba(6, 108, 250, 1);
    }
  '';
  };*/
}
