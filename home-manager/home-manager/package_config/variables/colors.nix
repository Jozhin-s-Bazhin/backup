{ lib, ... }:

{
  nixToHex = color: "${color.hex.r}${color.hex.g}${color.hex.b}";
  hexCompToDec = hexComp: lib.fromHex hexComp;  # Correctly defined function name
  hexToRGB = color: { r = hexCompToDec color.r; };

  opacity = 1;

  opacity_secondary = 0.85;

  accent = {r = "06"; g = "6c"; b = "fa";};

  background = {r = "25"; g = "25"; b = "25";};
}

