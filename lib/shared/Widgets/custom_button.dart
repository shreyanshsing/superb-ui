import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/theme/palette.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  ButtonColor? color = ButtonColor.primary;
  FocusNode? focusNode;
  bool? isLoading = false;
  ButtonType? type;
  IconData? icon;
  bool? isFullWidth;
  TextColor? textColor = TextColor.highlight;
  Size? textSize = Size.large;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.focusNode,
    this.isLoading = false,
    this.icon,
    this.type = ButtonType.filled,
    this.isFullWidth = false,
    this.textColor,
    this.textSize,
  });

  TextColor getTextColor() {
    switch (type) {
      case ButtonType.filled:
        return TextColor.primary;
      case ButtonType.outline:
        return TextColor.primary;
      case ButtonType.text:
        return textColor != null ? textColor! : TextColor.highlight;
      default:
        return TextColor.primary;
    }
  }

  Color getColor() {
    switch (color) {
      case ButtonColor.primary:
        return ColorPalette.primaryButtonColor;
      case ButtonColor.secondary:
        return ColorPalette.secondaryButtonColor;
      case ButtonColor.tertiary:
        return ColorPalette.tertiaryButtonColor;
      default:
        return ColorPalette.primaryButtonColor;
    }
  }

  Widget getContent() {
    return Container(
      padding: type == ButtonType.text
          ? null
          : const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: isLoading!
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) Icon(icon, color: ColorPalette.primaryColor),
                const SizedBox(width: 10),
                CustomText(
                  text: text,
                  color: getTextColor(),
                  fontSize: textSize,
                  fontWeight: TextWeight.bold,
                ),
              ],
            ),
    );
  }

  Widget getButtonContent() {
    if (isFullWidth ?? false) {
      return getContent();
    }
    return IntrinsicWidth(child: getContent());
  }

  Widget filledButton(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(
          getColor(),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: getButtonContent(),
    );
  }

  Widget outlinedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed as void Function()?,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(
          getColor(),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: getButtonContent(),
    );
  }

  Widget textButton(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: onPressed as void Function()?,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(5.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: getButtonContent(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return type == ButtonType.filled
        ? filledButton(context)
        : type == ButtonType.text
            ? textButton(context)
            : outlinedButton(context);
  }
}
