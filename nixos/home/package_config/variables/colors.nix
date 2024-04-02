{ lib }:
let
    # Function to convert a single hex digit to its decimal value
  hexDigitToDec = digit:
    if digit == "a" then 10
    else if digit == "b" then 11
    else if digit == "c" then 12
    else if digit == "d" then 13
    else if digit == "e" then 14
    else if digit == "f" then 15
    else lib.toInt digit;

  hexToDec = hex: lib.foldl' (acc: x: acc * 16 + x) 0 (lib.splitString "" hex);
in
{

  # Main function to convert a set of hex color components to their decimal equivalents
  nixToRGB = hexSet: {
    r = hexToDec hexSet.r;
    g = hexToDec hexSet.g;
    b = hexToDec hexSet.b;
  };
  nixToHex = color: "${color.r}${color.g}${color.b}";

  opacity = 1;
  opacity_secondary = 0.85;

  accent = {r = "06"; g = "6c"; b = "fa";};
  background = {r = "25"; g = "25"; b = "25";};
  background_darker = { r = "18"; g = "18"; b = "18"; };
}
