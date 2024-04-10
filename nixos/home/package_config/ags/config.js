import { Bar } from "./bar/bar.js";
import { NotificationPopups } from "./notifications/NotificationPopups.js";

App.config({
    style: App.configDir + "style.css",
    windows: [
        Bar(0),
	NotificationPopups()
    ]
})
