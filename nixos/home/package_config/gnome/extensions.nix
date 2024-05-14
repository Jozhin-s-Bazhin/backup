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

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix";
    };
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
