from pyprland.plugins.interface import Plugin


class Extension(Plugin):
    """A plugin for better workspaces, similar to Gnome"""

    async def event_focusedmon(self, hyprctl_return):
        monname, workspacename = hyprctl_return.split(",")  # Where monname is the name of the monitor the cursor was just moved to (for example 'eDP-1')
        
        workspaces = [ workspace["id"] for workspace in (await self.hyprctlJSON("workspaces")) if workspace["id"] > 0]
        active_workspaces = [ monitor for monitor in (await self.hyprctlJSON("monitors"))]
        
        print(active_workspaces)