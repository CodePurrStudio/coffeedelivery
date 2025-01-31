//hex code convert function create

import 'dart:ui';

class CoreColor {
  static Color backgroundColor = fromHex("#201520");
  static Color bottomBarColor = fromHex("#22151F");

  static Color buttonColor = fromHex("#EFE3C8");
  static Color cardColor = fromHex("#362C36");
  static Color moneyBgColor = fromHex("#414141");
  static Color formColor = fromHex("#171017");
  static Color leftTabColor = fromHex("#704341");
  static Color starColor = fromHex("#D3A601");

// hex color converted function
  static Color fromHex(String hexString) {
    if (hexString.isEmpty) {
      throw ArgumentError("Hex color string cannot be empty");
    }

    final buffer = StringBuffer();
    hexString =
        hexString.replaceAll("#", "").trim(); // Remove # and trim whitespace

    if (hexString.length == 6) {
      buffer.write("FF"); // Add full opacity if missing
    } else if (hexString.length != 8) {
      throw ArgumentError("Invalid hex color format. Use RRGGBB or AARRGGBB.");
    }

    buffer.write(hexString);

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
