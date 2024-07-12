import 'package:flutter/material.dart';
import 'package:video_streaming_ui/theme/palette.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
      useMaterial3: true,
      fontFamily: 'NotoSans',
      primaryColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.backgroundColor,
    );
  }
}
