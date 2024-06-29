import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';

class InfoField extends StatelessWidget {
  const InfoField({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  final String label;
  final String value;
  final IconData? icon;

  Widget showText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: CustomText(
            text: label,
            fontSize: SIZE.small,
            fontWeight: WEIGHT.light,
            color: COLOR.tertiary,
          ),
        ),
        const SizedBox(height: 10),
        Flexible(
          child: CustomText(
            text: value,
            fontSize: SIZE.medium,
            fontWeight: WEIGHT.light,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )
              : Icon(
                  Icons.info,
                  color: Theme.of(context).primaryColor,
                ),
          const SizedBox(width: 10),
          Flexible(child: showText()),
        ],
      ),
    );
  }
}
