import { Bar } from "./bar/bar.js";

App.config({
    style: "./bar/bar.css",
    windows: [
        Bar(0),
        Bar(1),
        Bar(2)
    ]
})
