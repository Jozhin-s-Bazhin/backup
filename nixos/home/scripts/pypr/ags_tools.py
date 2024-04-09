from pyprland.plugins.interface import Plugin


class Extension(Plugin):
    """A plugin that provides some useful features for ags like opening ags widgets when new monitors are connected"""
    
    async def event_monitoradded(self, event_data):
        """"""
        pass