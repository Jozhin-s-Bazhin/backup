from pyprland.plugins.interface import Plugin
import subprocess


class Extension(Plugin):
    """A plugin that provides some useful features for ags like opening ags widgets when new monitors are connected"""

    async def get_monitors(self):
        return [ monitor.id for monitor in await self.hyprctlJSON("monitors") ]
 
    async def on_reload(self):
        monitors = await self.get_monitors(self)
        for monitor in monitors:
            subprocess.run(["ags", "-r", "import {{ Bar }} from \"../../package_config/ags/bar.js\"; bar({0})".format(monitor)])
   
    async def event_monitoradded(self, event_data):

    async def event_monitorremoved(self, event_data):
