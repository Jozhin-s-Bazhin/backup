const greetd = await Service.import('greetd');

const name = Widget.Entry({
    css: "color: black; background-color: white; border-radius: 10px;",
    placeholder_text: 'Username',
    on_accept: () => password.grab_focus(),
})

const password = Widget.Entry({
    css: "color: black; background-color: white; border-radius: 10px;",
    placeholder_text: 'Password',
    visibility: false,
    on_accept: () => {
        greetd.login("roman" || '', password.text || '', 'Hyprland')
            .catch(() => password.text = "", password.grab_focus())
    },
})

const stack = Widget.ListBox({
    setup(self) {
        self.add(Widget.Label("roman"))
    },
})

const win = Widget.Window({
    css: 'background-image: url("/etc/nixos/home/package_config/wallpaper_blurred.png");',
    anchor: ['top', 'left', 'right', 'bottom'],
    child: Widget.Box({
        vertical: false,
        hpack: 'center',
        vpack: 'center',
        hexpand: true,
        vexpand: true,
        children: [
            stack,
            password,
        ],
    }),
})

App.config({ windows: [win] })
