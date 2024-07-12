import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/theme/palette.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  Size? fontSize = Size.medium;
  TextWeight? fontWeight = TextWeight.regular;
  TextColor? color = TextColor.primary;
  double? letterSpacing;
  TextType? type = TextType.body;
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
      case Size.small:
        return 12.0;
      case Size.medium:
        return 16.0;
      case Size.large:
        return 20.0;
      case Size.extraLarge:
        return 28.0;
      case Size.extraExtraLarge:
        return 32.0;
      case Size.custom:
        return customFontSize;
      default:
        return 16.0;
    }
  }

  FontWeight? getFontWeight() {
    switch (fontWeight) {
      case TextWeight.light:
        return FontWeight.w200;
      case TextWeight.regular:
        return FontWeight.w300;
      case TextWeight.medium:
        return FontWeight.w400;
      case TextWeight.semiBold:
        return FontWeight.w600;
      case TextWeight.bold:
        return FontWeight.w700;
      default:
        return FontWeight.w300;
    }
  }

  Color getColor() {
    switch (color) {
      case TextColor.primary:
        return ColorPalette.primaryTextColor;
      case TextColor.secondary:
        return ColorPalette.secondaryTextColor;
      case TextColor.tertiary:
        return ColorPalette.tertiaryTextColor;
      case TextColor.error:
        return ColorPalette.errorTextColor;
      case TextColor.highlight:
        return ColorPalette.highlightTextColor;
      default:
        return ColorPalette.primaryTextColor;
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
        fontFamily: 'NotoSans',
      ),
    );
  }
}
