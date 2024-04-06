from pyprland.plugins.interface import Plugin


class Extension(Plugin):
    " My plugin "

    async def init(self):
        await self.notify("My plugin loaded")