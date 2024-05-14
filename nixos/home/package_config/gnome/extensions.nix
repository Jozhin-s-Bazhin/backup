{ ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "forge@forge-ext"
	"user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Flat-Remix";
    };
  };
}
