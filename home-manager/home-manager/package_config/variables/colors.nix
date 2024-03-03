{ lib, ... }:

{
  nixToHex = color: "${color.r}${color.g}${color.b}";
  hexToRGB = color: { r = lib.fromHex color.r; g = lib.fromHex color.g; b = lib.fromHex color.b; };

  opacity = 1;
  opacity_secondary = 0.90;
  accent = {r = "06"; g = "6c"; b = "fa";};
  background = {r = "25"; g = "25"; b = "25";};
  background_darker = { r = "15"; g = "15"; b = "15"; };
}

