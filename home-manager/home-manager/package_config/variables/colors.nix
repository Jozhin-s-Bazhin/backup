{ lib, ... }:

{
  nixToHex = color: "${color.hex.r}${color.hex.g}${color.hex.b}";
  hexToRGB = color: { r = lib.fromHex color.r; g = lib.fromHex color.g; b = lib.fromHex color.b; };

  opacity = 1;

  opacity_secondary = 0.85;

  accent = {r = "06"; g = "6c"; b = "fa";};

  background = {r = "25"; g = "25"; b = "25";};
}

