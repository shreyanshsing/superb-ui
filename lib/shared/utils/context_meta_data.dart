import 'package:flutter/material.dart';

class ContextMetaData {
  final BuildContext context;

  ContextMetaData({required this.context});
  double width = 0.0;
  double height = 0.0;

  void init() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  double getWidth(double percent) {
    return width * percent;
  }

  double getHeight(double percent) {
    return height * percent;
  }

  Color? getPrimaryColor() {
    return Theme.of(context).primaryColor;
  }

  Color? getBackgroundColor() {
    return Theme.of(context).scaffoldBackgroundColor;
  }
}
