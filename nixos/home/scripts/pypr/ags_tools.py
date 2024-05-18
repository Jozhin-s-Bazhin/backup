from pyprland.plugins.interface import Plugin
import subprocess


class Extension(Plugin):
    """A plugin that provides some useful features for ags like opening ags widgets when new monitors are connected"""
    
    async def __init__(self, *args):
        super().__init__(*args)
        monitors = [ monitor["id"] for monitor in await self.hyprctlJSON("monitors") ]
        for monitor in range(3): 
            if monitor not in monitors:
                subprocess.run("ags", "-t", f"bar-{monitor}")

    async def event_monitoraddedv2(self, monitor):
        monitor_id = monitor.split(",")[0]
        subprocess.run(["ags", "-t", f"bar-{monitor}"])
        
    async def event_monitorremoved(self, monitorname):
        monitors = self.hyprctlJSON("monitors")
        for monitor in monitors:
            if monitor["name"] == monitorname:
                monitor_id = monitor["id"]
                break
        subprocess.run(["ags", "-t", f"bar-{monitor_id}"])
