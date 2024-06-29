import 'package:flutter/material.dart';

class PillText extends StatelessWidget {
  const PillText({
    super.key,
    required this.text,
    required this.pillColor,
    required this.textColor,
    this.fontSize = 14,
  });

  final String text;
  final Color pillColor;
  final Color textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: pillColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
