{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "forge@forge-ext"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
	"blur-my-shell@aunetx"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix";
    };
    #"org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
