from pyprland.plugins.interface import Plugin


async def get_workspaces():
    """Gets a list of all workspaces"""

async def move_workspaces_to_focused_mon(self, event_data):
    """Takes in a value the hyprland socket gives when changing monitors and moves all inactive windows to that monitor"""
    monname, workspacename = event_data.split(",")  # Where monname is the name of the monitor the cursor was just moved to (for example 'eDP-1')
    
    workspaces = [ workspace["id"] for workspace in (await self.hyprctlJSON("workspaces")) if workspace["id"] > 0 ]
    active_workspaces = [ monitor["activeWorkspace"]["id"] for monitor in (await self.hyprctlJSON("monitors")) ]

    batch = []
    for workspace in workspaces:
        if workspace not in active_workspaces:
            batch.append(f"moveworkspacetomonitor {workspace} {monname}")
            
    await self.hyprctl(batch)
 
#async def rearrange_workspaces(self):
#    """Rearrange workspaces to be in the correct order by changing their name (ID will not be changed!!!)"""

class Extension(Plugin):
    """A plugin for better workspaces, similar to Gnome's workspace behaviour"""

    async def event_focusedmon(self, event_data):
        await move_workspaces_to_focused_mon(self, event_data)

    async def event_workspacev2(self, event_data):