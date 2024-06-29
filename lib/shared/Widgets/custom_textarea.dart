import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLines;

  const CustomTextArea({
    super.key,
    required this.labelText,
    required this.controller,
    this.focusNode,
    this.textInputAction,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      onTapOutside: (d) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
