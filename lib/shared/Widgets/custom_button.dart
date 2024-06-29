import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  COLOR? color = COLOR.secondary;
  COLOR? textColor = COLOR.secondary;
  FocusNode? focusNode;
  bool? isLoading = false;
  BUTTON_TYPE? type;
  IconData? icon;
  WEIGHT? fontWeight;
  SIZE? fontSize;

  CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.focusNode,
    this.isLoading = false,
    this.type = BUTTON_TYPE.filled,
    this.icon,
    this.fontWeight = WEIGHT.regular,
    this.fontSize = SIZE.medium,
  });

  Color? getColor() {
    switch (color) {
      case COLOR.primary:
        return const Color(0xff32b1ea);
      case COLOR.secondary:
        return const Color.fromARGB(255, 255, 255, 255);
      case COLOR.tertiary:
        return const Color.fromARGB(255, 128, 128, 128);
      case COLOR.red:
        return const Color.fromARGB(255, 255, 0, 0);
      default:
        return Colors.white;
    }
  }

  Color getTextColor() {
    switch (textColor) {
      case COLOR.primary:
        return const Color(0xff32b1ea);
      case COLOR.secondary:
        return const Color.fromARGB(255, 255, 255, 255);
      case COLOR.tertiary:
        return const Color.fromARGB(255, 128, 128, 128);
      case COLOR.red:
        return const Color.fromARGB(255, 255, 0, 0);
      default:
        return Colors.white;
    }
  }

  Widget getText() {
    if (isLoading!) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, color: getTextColor()),
          if (icon != null) const SizedBox(width: 10),
          CustomText(
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: type == BUTTON_TYPE.outline ? COLOR.primary : textColor,
          ),
        ],
      );
    }
  }

  Widget filledButton(context) {
    return IntrinsicWidth(
      stepWidth: double.infinity,
      child: ElevatedButton(
        focusNode: focusNode,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(5.0),
          backgroundColor: MaterialStateProperty.all<Color>(getColor()!),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
          ),
        ),
        onPressed: !isLoading! ? () => onPressed() : null,
        child: getText(),
      ),
    );
  }

  Widget outlineButton(context) {
    return IntrinsicWidth(
      stepWidth: double.infinity,
      child: OutlinedButton(
        focusNode: focusNode,
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),
          elevation: MaterialStateProperty.all<double>(5.0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
          ),
        ),
        onPressed: !isLoading! ? () => onPressed() : null,
        child: getText(),
      ),
    );
  }

  Widget textButton(context) {
    return TextButton(
      focusNode: focusNode,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5.0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
        ),
      ),
      onPressed: !isLoading! ? () => onPressed() : null,
      child: getText(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return type == BUTTON_TYPE.filled
        ? filledButton(context)
        : type == BUTTON_TYPE.text
            ? textButton(context)
            : outlineButton(context);
  }
}
