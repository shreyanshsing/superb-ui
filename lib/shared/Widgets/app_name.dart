import 'package:flutter/material.dart';

import 'CustomText/main.dart';
import 'enum.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: 'Superb',
      fontSize: Size.extraExtraLarge,
      fontWeight: TextWeight.bold,
      color: TextColor.highlight,
    );
  }
}
