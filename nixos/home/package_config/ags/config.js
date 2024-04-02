import { Bar } from "./bar/bar.js";
const monitor = 0;

App.config({
    style: "./bar/bar.css",
    windows: [
        Bar(monitor)
    ]
})
