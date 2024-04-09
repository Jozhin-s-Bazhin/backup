const greetd = await Service.import('greetd');

const name = Widget.Entry({
    //css: "color: black; background-color: white; border-radius: 10px;"
    placeholder_text: 'Username',
    on_accept: () => password.grab_focus(),
})

const password = Widget.Entry({
    //css: "color: black; background-color: white; border-radius: 10px;"
    placeholder_text: 'Password',
    visibility: false,
    on_accept: () => {
        greetd.login(name.text || '', password.text || '', 'Hyprland')
            .catch(err => response.label = JSON.stringify(err))
    },
})

const response = Widget.Label()

const win = Widget.Window({
    css: 'background-image: url("/etc/nixos/home/package_config/wallpaper_blurred.png");',
    anchor: ['top', 'left', 'right', 'bottom'],
    child: Widget.Box({
	//css: "background-color: blue",
        vertical: true,
        hpack: 'center',
        vpack: 'center',
        hexpand: true,
        vexpand: true,
        children: [
            name,
            password,
            response,
        ],
    }),
})

App.config({ windows: [win] })
