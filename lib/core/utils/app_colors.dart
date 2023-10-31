import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color yellow1 = const Color(0xffE8B100);
  static Color yellow2 = const Color(0xffFFE799);
  static Color blue1 = const Color(0xff4C4C6D);
  static Color grey1 = const Color(0xffDCDCDC);

  static Color primary = HexColor('#FF8200');
  static Color secondPrimary = HexColor('#E8B100');
  static Color orangeThirdPrimary = HexColor('#FF9201');
  static Color blueLiteColor = HexColor('#00B3DC');
  static Color buttonColor = HexColor('#4C4C6D');
  static Color greyColor = HexColor('#E9EAEB');
  static Color blueTextColor = HexColor('#5663FF');
  static Color grayTextColor = HexColor('#6E7FAA');
  static Color goldStarColor = HexColor('#FFCC00');
  static Color unStarColor = HexColor('#E9E9EE');
  static Color scaffoldColor = HexColor('#F5F5F5');
  static Color avatarColor = HexColor('#96B2B5');
  static Color redColor = HexColor('#E80000');
  static Color disabledColor = HexColor('#BABFC4');

  static Color hint = Colors.grey;
  static Color blackLite = Colors.black54;
  static Color error = Colors.red;
  static Color success = Colors.green;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color gray = Colors.grey;
  static Color grayLite = Colors.grey[700]!;
  static Color gray1 = HexColor('#C4C4C4');
  static Color gray2 = HexColor('#BABABB');
  static Color gray3 = HexColor('#DCDCDC');
  static Color gray4 = HexColor('#EEEEEE');
  static Color gray5 = HexColor('#F2F2F2');
  // static Color gray6 = HexColor('#A7A7A7');
  static Color gray6 = HexColor('#A7A7A7');
  // static Color gray7 = HexColor('#A0A1A0');
  static Color red = HexColor('#FF0000');
  static Color blue3 = const Color(0xff3646ff);
  static Color bink = HexColor('#FF9F9F');
  static Color purple1 = HexColor('#854AA4');
  static Color purple1light = HexColor('#E3D2FE');
  static Color blue = HexColor('#143A7B');
  //static Color blue1 = HexColor('#CBDFF8');
  static Color blue2 = HexColor('#8290F8');
  static Color blue4 = const Color(0xff3E3F68);
  static Color bluelight = HexColor('#D7EAF9');
  static Color orange = HexColor('#FE7C04');
  static Color orangelight = HexColor('#FFEAD7');
  static Color opacityWhite = Colors.white.withOpacity(0.5);
  static Color transparent = Colors.transparent;
  static Color dividerColor = HexColor('#C2C2C2');

  ///
  ///

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    //
    // Color darken(Color color, [double amount = .1]) {
    //   assert(amount >= 0 && amount <= 1);
    //
    //   final hsl = HSLColor.fromColor(color);
    //   final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    //
    //   return hslDark.toColor();
    // }
    //
    // Color lightens(String color, [double amount = .1]) {
    //   assert(amount >= 0 && amount <= 1);
    //
    //   final hsl = HSLColor.fromColor(HexColor(color));
    //   final hslLight = hsl.withLightness(
    //       (hsl.lightness + amount).clamp(0.0, 1.0));
    //
    //   return hslLight.toColor();
    // }
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightens(String color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(HexColor(color));
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
