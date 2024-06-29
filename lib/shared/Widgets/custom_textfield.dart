import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function? onCompleted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function? onFieldSubmitted;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.focusNode,
    this.onCompleted,
    this.textInputAction,
    this.keyboardType,
    this.onFieldSubmitted,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) => onFieldSubmitted?.call(value),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSaved: (value) => onCompleted?.call(value),
      focusNode: focusNode,
      validator: validator,
      onTapOutside: (d) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Theme.of(context).primaryColor,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: Theme.of(context).primaryColor,
        ),
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
