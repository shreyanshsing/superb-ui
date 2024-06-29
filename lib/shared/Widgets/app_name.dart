import 'package:flutter/material.dart';

import 'CustomText/enum.dart';
import 'CustomText/main.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: 'Superb',
      fontSize: SIZE.extraExtraLarge,
      fontWeight: WEIGHT.bold,
      color: COLOR.primary,
    );
  }
}
