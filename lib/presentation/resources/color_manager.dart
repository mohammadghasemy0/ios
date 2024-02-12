import 'dart:ui';

class ColorManager {
  static Color primary = HexColor.fromHex('#F44336');
  static Color secondary = HexColor.fromHex('#FF2196F3');
  // static Color secondary = HexColor.fromHex('#FFC107');
  static Color tertiary = HexColor.fromHex('#4CAF50');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
  static Color black = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length >= 6){
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}