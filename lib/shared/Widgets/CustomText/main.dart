import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  SIZE? fontSize = SIZE.medium;
  WEIGHT? fontWeight = WEIGHT.regular;
  COLOR? color = COLOR.secondary;
  double? letterSpacing;
  TYPE? type = TYPE.body;
  double? customFontSize;

  CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.letterSpacing,
    this.type,
    this.customFontSize,
  });

  double? getFontSize() {
    switch (fontSize) {
      case SIZE.small:
        return 12.0;
      case SIZE.medium:
        return 16.0;
      case SIZE.large:
        return 20.0;
      case SIZE.extraLarge:
        return 30.0;
      case SIZE.extraExtraLarge:
        return 40.0;
      case SIZE.custom:
        return customFontSize;
      default:
        return 16.0;
    }
  }

  FontWeight? getFontWeight() {
    switch (fontWeight) {
      case WEIGHT.light:
        return FontWeight.w300;
      case WEIGHT.regular:
        return FontWeight.w400;
      case WEIGHT.medium:
        return FontWeight.w500;
      case WEIGHT.semiBold:
        return FontWeight.w600;
      case WEIGHT.bold:
        return FontWeight.w700;
      default:
        return FontWeight.w400;
    }
  }

  Color? getColor() {
    switch (color) {
      case COLOR.primary:
        return const Color(0xff32b1ea);
      case COLOR.secondary:
        return const Color.fromARGB(255, 255, 255, 255);
      case COLOR.tertiary:
        return const Color.fromARGB(200, 255, 255, 255);
      case COLOR.red:
        return const Color.fromARGB(255, 255, 0, 0);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      text,
      style: TextStyle(
        fontSize: getFontSize(),
        fontWeight: getFontWeight(),
        color: getColor(),
        letterSpacing: letterSpacing,
      ),
    );
  }
}
