import { Bar } from "./bar.js";
const monitor = 0;

App.config({
    style: "./bar.css",
    windows: [
        Bar(monitor)
    ]
})
