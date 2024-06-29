import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: const ColorScheme.dark(),
      useMaterial3: true,
      fontFamily: 'Roboto',
      primaryColor: const Color(0xff32b1ea),
      scaffoldBackgroundColor: Colors.black12,
    );
  }
}
