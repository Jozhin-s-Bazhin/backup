import { Bar } from "./bar/bar.js";
//import { NotificationPopups } from "./notifications/notificationPopups.js"

App.config({
    style: "./style.css",
    windows: [
	Bar(0),
	//NotificationPopups(),
    ]
})
