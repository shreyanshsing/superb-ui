import 'package:flutter/material.dart';
import 'package:video_streaming_ui/theme/palette.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final Duration duration;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.backgroundColor,
    this.textColor,
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: textColor ?? ColorPalette.secondaryTextColor,
        ),
      ),
      backgroundColor: backgroundColor ?? ColorPalette.backgroundSecondaryColor,
      duration: duration,
    );
  }
}
