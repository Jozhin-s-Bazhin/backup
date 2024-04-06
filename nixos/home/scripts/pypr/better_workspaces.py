from pyprland.plugins.interface import Plugin


async def get_workspaces(self):
    workspaces = [ workspace["id"] for workspace in (await self.hyprctlJSON("workspaces")) if workspace["id"] > 0 ]
    return workspaces

async def move_workspaces_to_focused_mon(self, event_data):
    """Takes in a value the hyprland socket gives when changing monitors and moves all inactive windows to that monitor"""
    monname, workspacename = event_data.split(",")  # Where monname is the name of the monitor the cursor was just moved to (for example 'eDP-1')
    
    workspaces = await get_workspaces(self)
    active_workspaces = [ monitor["activeWorkspace"]["id"] for monitor in (await self.hyprctlJSON("monitors")) ]

    batch = []
    for workspace in workspaces:
        if workspace not in active_workspaces:
            batch.append(f"moveworkspacetomonitor {workspace} {monname}")
            
    if batch:
        await self.hyprctl(batch)
 
async def get_target_workspace(self, workspaceid):
    workspaceid = int(workspaceid)
    workspaces = await get_workspaces(self)
    workspaces.sort()
    
    if workspaceid > len(workspaces):
        target = workspaces[-1] + 1
    else:
        target = workspaces[workspaceid - 1]
        
    return target
    

class Extension(Plugin):
    """A plugin for better workspaces, similar to Gnome's workspace behaviour, but also with a function to insert workspaces"""

    async def event_focusedmon(self, event_data):
        await move_workspaces_to_focused_mon(self, event_data)
        
    async def run_workspace(self, workspaceid):
        target = await get_target_workspace(self, workspaceid)
        await self.hyprctl(f"workspace {target}")
        
    async def run_movetoworkspace(self, workspaceid):
        target = await get_target_workspace(self, workspaceid)
        await self.hyprctl(f"movetoworkspace {target}")